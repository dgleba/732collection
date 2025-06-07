#!/bin/sh
set -vx
set -e
cd /opt/etherpad-lite

# Install regular plugins
# npm install ep_adminpads3


# Link our local plugin (already mounted)
cd node_modules/ep_acepad
npm install --legacy-peer-deps

cd /opt/etherpad-lite

# Start Etherpad
exec bin/run.sh 
tail -f /dev/null
# bin/run.sh || true
