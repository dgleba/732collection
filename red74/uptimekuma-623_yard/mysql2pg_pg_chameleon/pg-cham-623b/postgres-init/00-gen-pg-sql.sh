#!/bin/bash
set -e

# These will now appear in your 'dc up' logs
echo "Current directory:" && pwd
echo "Running as user:" && whoami


echo "Checking variable: PG_user_pass is ${PG_user_pass}" # If this is empty, envsubst will output nothing

envsubst < /docker-entrypoint-initdb.d/10-init-pg.sql.template > /docker-entrypoint-initdb.d/10-init-pg.sql


chmod 777 /docker-entrypoint-initdb.d/10*.sql

