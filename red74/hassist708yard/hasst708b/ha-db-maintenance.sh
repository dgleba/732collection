#!/usr/bin/env bash

# usage:   cd /ap/dkr/732collection/red74/hassist708yard/hasst708b &&  bash ./ha-db-maintenance.sh

set -euo pipefail

# Load environment variables
source .env

TS="$(date +'%Y-%m-%d_%H-%M-%S')"
BACKUP_DIR="../sysdata/db-maintenance/${TS}"
DB="${HA_CONFIG}/home-assistant_v2.db"
LOG="${BACKUP_DIR}/maintenance.log"

mkdir -p "$BACKUP_DIR"

log() {
    echo "[$(date +'%F %T')] $*" | tee -a "$LOG"
}

log "=== Home Assistant DB Maintenance Started ==="

log "Stopping Home Assistant container..."
docker stop "$HA_CONTAINER"

log "Backing up DB to $BACKUP_DIR..."
cp "$DB" "$BACKUP_DIR/"
sha256sum "$BACKUP_DIR/home-assistant_v2.db" | tee -a "$LOG"

log "Running SQLite VACUUM..."
sqlite3 "$DB" "VACUUM;"

log "Starting Home Assistant container..."
docker start "$HA_CONTAINER"

log "Waiting for Home Assistant API to become available..."
# Try for up to 30 seconds
for i in {1..30}; do
    if curl -s -o /dev/null "${HA_URL}/api/"; then
        log "Home Assistant API is up."
        break
    fi
    sleep 1
done

if ! curl -s -o /dev/null "${HA_URL}/api/"; then
    log "ERROR: Home Assistant API did not come online. Aborting."
    exit 1
fi

log "Triggering HA purge via API (keep 7 days)..."
PURGE_HTTP_CODE=$(curl -s -w "%{http_code}" -o /tmp/ha_purge.out \
    -X POST \
    -H "Authorization: Bearer ${HA_TOKEN}" \
    -H "Content-Type: application/json" \
    -d '{"keep_days": 7, "repack": false}' \
    "${HA_URL}/api/services/recorder/purge")

if [ "$PURGE_HTTP_CODE" -ne 200 ]; then
    log "ERROR: Purge API call failed with HTTP $PURGE_HTTP_CODE"
    log "Response body:"
    cat /tmp/ha_purge.out | tee -a "$LOG"
    exit 1
fi

log "Purge API call succeeded. Response body:"
cat /tmp/ha_purge.out | tee -a "$LOG"

log "Verifying DB integrity..."
sqlite3 "$DB" "PRAGMA integrity_check;" | tee -a "$LOG"

log "=== Maintenance Complete ==="
