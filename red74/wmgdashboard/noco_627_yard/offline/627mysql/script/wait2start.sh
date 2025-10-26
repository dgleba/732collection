#!/bin/bash

echo;date;echo Starting wait2start.sh..
date

s=9 ; read  -rsp $"Wait $s seconds or press Escape-key or Arrow key to continue..." -t $s -d $'\e'; echo;echo;


# make scripts and folders executable (folders need to be executable to cd into them)
find . -iname "*.sh" -exec bash -c 'chmod +x "$0"' {} \;
chmod ugo+x $(find . -type d)

set -e


# ======================================================================
# Look at command line args..
 
cmd="$@"
echo   "cmd var is:  $cmd"


# ======================================================================
# example
#
# until PGPASSWORD=$POSTGRES_PASSWORD psql -h "postgres429" -U "postgres" -c '\q'; do
#   >&2 echo "Postgres is unavailable - sleeping"
#   sleep 1
# done


# ======================================================================
# Wait for two other services to be ready..

# chain to wait-for-it.. w2
# this will wait until w2 starts or -t 299 seconds max.
# it will try for -t 299 seconds. it will continue 1 second after it starts. It will fail after 299 seconds.

date
bash ./conf/wait-for-it.sh dbm:3306 -t 299 
date
echo --- --- past first wait.


# chain to wait-for-it.. w3
# date
# bash ./conf/wait-for-it.sh corp:3306 -t 299 
# date
# echo --- --- --- past second wait.




# ======================================================================
# Try to continue to start normally now..

set -vx
echo; date; echo Ending wait2start.sh.
# exec the passed in command to start things normally...
# exec "$@"

# https://github.com/agileek/docker/blob/master/tomcat/wait-for-mysql.sh
# https://github.com/vishnubob/wait-for-it/issues/57

# exec ./conf/start.sh

exec "$@"
