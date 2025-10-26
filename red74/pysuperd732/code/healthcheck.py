import sys
import os

# your script needs to update `heartbeat-health.txt` periodically.


# Example: check if a heartbeat file was updated recently

try:
    mtime = os.path.getmtime("heartbeat-health.txt")
    if (time.time() - mtime) > 120:
        sys.exit(1)  # unhealthy
except Exception:
    sys.exit(1)

sys.exit(0)  # healthy
