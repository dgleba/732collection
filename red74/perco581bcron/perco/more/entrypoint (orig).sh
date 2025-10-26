#!/bin/bash

# Start the run once job.
echo "Docker container started entrypoint.sh"

# Get env method 2
# turn on bash's job control
set -m
# extract environment variables for cron
printenv | sed 's/^\(.*\)$/export \1/g' > /root/project_env.sh

# Start the helper processes
# for debugging cron
# service rsyslog start
# not using this.. see below
# service cron start

# Setup a cron schedule
# /proc/1/fd/1 goes to docker log 
echo "SHELL=/bin/bash
BASH_ENV=/root/project_env.sh
#
#9  */2  *  *  *  bash /code/ptarc02.sh >> /proc/1/fd/1  2>&1
#*/1  *  *  *  *  bash /code/ptarc03.sh >> /proc/1/fd/1  2>&1
#*  *  *  *  *  bash /code/testcr21.sh >> /proc/1/fd/1  2>&1
#
# This extra line makes it a valid cron" > /crontab.txt

echo
echo Starting /crontab.txt.  Rev: 10 -   $(date +"%Y.%m.%d_%H.%M.%S")
echo

# run once at start
# bash /code/ptarc03.sh 

#crontab /crontab.txt
#cron -f

