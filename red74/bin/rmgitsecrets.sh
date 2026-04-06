#!/usr/bin/env bash
set -euo pipefail

# CONFIG: patterns to scrub (extended regex, applied to blob contents)
SECRET_PATTERNS=(
  'AC[0-9a-fA-F]{32}'          # Twilio Account SID-like
  'SK[0-9a-fA-F]{32}'          # Twilio API Key-like
)

# CONFIG: replacement text
REPLACEMENT='***REDACTED_SECRET***'

# CONFIG: audit log file
AUDIT_LOG="secret-scrub-audit.log"

# CONFIG: path filters (optional). Empty means "all paths".
PATH_INCLUDE=(
  'red74/peekaping_826_yard/peekaping826/apps/web/src/app/notification-channels/integrations/twilio-form.tsx'
)

# --- helpers ---------------------------------------------------------------

die() {
  echo "ERROR: $*" >&2
  exit 1
}

require_clean_worktree() {
  if ! git diff --quiet || ! git diff --cached --quiet; then
    die "Working tree not clean. Commit or stash changes first."
  fi
}

require_filter_repo() {
  if ! command -v git-filter-repo >/dev/null 2>&1 && ! command -v git filter-repo >/dev/null 2>&1; then
    die "git-filter-repo not found. Install it first: https://github.com/newren/git-filter-repo"
  fi
}

git_filter_repo_cmd() {
  if command -v git-filter-repo >/dev/null 2>&1; then
    echo "git-filter-repo"
  else
    echo "git filter-repo"
  fi
}

join_by() {
  local IFS="$1"; shift; echo "$*"
}

# --- mode: detect ----------------------------------------------------------

mode_detect() {
  echo "# DETECT MODE" | tee "$AUDIT_LOG"
  echo "# Repository: $(pwd)" | tee -a "$AUDIT_LOG"
  echo "# Date: $(date -Iseconds)" | tee -a "$AUDIT_LOG"
  echo | tee -a "$AUDIT_LOG"

  # Build path filter args for git log
  local path_args=()
  if ((${#PATH_INCLUDE[@]} > 0)); then
    path_args=(-- "${PATH_INCLUDE[@]}")
  fi

  # For each pattern, scan history
  for pat in "${SECRET_PATTERNS[@]}"; do
    echo "## Pattern: $pat" | tee -a "$AUDIT_LOG"

    # List commits that contain the pattern in any blob
    git rev-list --all |
      while read -r commit; do
        # List files in commit (optionally filtered)
        files=$(git ls-tree -r --name-only "$commit" -- "${PATH_INCLUDE[@]:-}" || true)
        [ -z "$files" ] && continue

        while read -r f; do
          [ -z "$f" ] && continue
          if git show "${commit}:${f}" 2>/dev/null | grep -Eq "$pat"; then
            echo "commit $commit file $f" | tee -a "$AUDIT_LOG"
          fi
        done <<< "$files"
      done

    echo | tee -a "$AUDIT_LOG"
  done

  echo "# DETECT COMPLETE" | tee -a "$AUDIT_LOG"
}

# --- mode: rewrite ---------------------------------------------------------

mode_rewrite() {
  require_clean_worktree
  require_filter_repo

  local filter_repo
  filter_repo=$(git_filter_repo_cmd)

  echo "# REWRITE MODE" | tee "$AUDIT_LOG"
  echo "# Repository: $(pwd)" | tee -a "$AUDIT_LOG"
  echo "# Date: $(date -Iseconds)" | tee -a "$AUDIT_LOG"
  echo | tee -a "$AUDIT_LOG"

  # Build path filter for filter-repo
  local path_args=()
  if ((${#PATH_INCLUDE[@]} > 0)); then
    for p in "${PATH_INCLUDE[@]}"; do
      path_args+=(--path "$p")
    done
  fi

  # Build combined sed script for all patterns
  local sed_script=""
  for pat in "${SECRET_PATTERNS[@]}"; do
    # Escape slashes in pattern and replacement
    local esc_pat esc_rep
    esc_pat="$pat"
    esc_rep="$REPLACEMENT"
    sed_script+="s/$esc_pat/$esc_rep/g;"
  done

  # Create a temporary filter script
  local filter_script
  filter_script=$(mktemp)
  cat > "$filter_script" <<EOF
import sys
from git_filter_repo import Blob

def replace(data: bytes) -> bytes:
    import re
    text = data.decode('utf-8', errors='ignore')
    text_new = text
EOF

  # Add Python regex replacements
  for pat in "${SECRET_PATTERNS[@]}"; do
    cat >> "$filter_script" <<EOF
    text_new = __import__('re').sub(r"$pat", "$REPLACEMENT", text_new)
EOF
  done

  cat >> "$filter_script" <<'EOF'
    if text_new != text:
        sys.stdout.write(f"# scrubbed blob\n")
    return text_new.encode('utf-8')

def blob_callback(blob, metadata):
    new_data = replace(blob.data)
    if new_data != blob.data:
        blob.data = new_data

callbacks = Blob.Callbacks(blob_callback=blob_callback)
EOF

  echo "# Running git filter-repo..." | tee -a "$AUDIT_LOG"

  # Run filter-repo with blob callback
  "$filter_repo" \
    --force \
    "${path_args[@]}" \
    --blob-callback "$filter_script" \
    --refs "refs/heads/*" \
    --analyze

  echo "# filter-repo completed" | tee -a "$AUDIT_LOG"
  echo "# NOTE: You must force-push rewritten branches to remotes." | tee -a "$AUDIT_LOG"

  rm -f "$filter_script"
}

# --- mode: report-touched --------------------------------------------------

mode_report_touched() {
  # After filter-repo, use its analysis to list touched commits/files
  local analysis_dir=".git/filter-repo"
  if [ ! -d "$analysis_dir" ]; then
    die "No .git/filter-repo directory found. Run rewrite mode first."
  fi

  echo "# REPORT MODE" | tee "$AUDIT_LOG"
  echo "# Repository: $(pwd)" | tee -a "$AUDIT_LOG"
  echo "# Date: $(date -Iseconds)" | tee -a "$AUDIT_LOG"
  echo | tee -a "$AUDIT_LOG"

  # This is intentionally simple: list all commits in current history and their files
  git rev-list --all |
    while read -r commit; do
      echo "commit $commit" | tee -a "$AUDIT_LOG"
      git ls-tree -r --name-only "$commit" | sed 's/^/  file /' | tee -a "$AUDIT_LOG"
      echo | tee -a "$AUDIT_LOG"
    done

  echo "# REPORT COMPLETE" | tee -a "$AUDIT_LOG"
}

# --- main ------------------------------------------------------------------

usage() {
  cat <<EOF
Usage: $0 MODE

MODE:
  detect        Scan full history for SECRET_PATTERNS and log matches to $AUDIT_LOG
  rewrite       Rewrite history with git filter-repo, scrubbing SECRET_PATTERNS
  report        Emit a simple audit of all commits/files after rewrite

Edit SECRET_PATTERNS, PATH_INCLUDE, and REPLACEMENT at the top of this script.
EOF
}

main() {
  local mode="${1:-}"
  case "$mode" in
    detect)  mode_detect ;;
    rewrite) mode_rewrite ;;
    report)  mode_report_touched ;;
    *)       usage; exit 1 ;;
  esac
}

main "$@"
