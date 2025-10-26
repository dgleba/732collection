#!/bin/bash

# Start the run once job.
echo "This is start_here.sh - Docker container starting..."

# Get env method 2
# turn on bash's job control
set -m
# extract environment variables for cron
printenv | sed 's/^\(.*\)$/export \1/g' > /root/project_env.sh

echo
echo Starting crontab.txt.  Rev: s53  @  $(date +"%Y.%m.%d_%H.%M.%S")
echo

cat     /code/crontab.txt
crontab /code/crontab.txt
cron -f
