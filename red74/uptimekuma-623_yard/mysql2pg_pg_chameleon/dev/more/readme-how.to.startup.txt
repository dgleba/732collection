
# Start up the system this way.

cd /ap/dkr/732collection/red74/uptimekuma-623_yard/mysql2pg_pg_chameleon/dev/pg-cham-test

mkdir -p sysdata

dc build

docker compose  -f dc.init.yml up 

# then stop it when the init is completed.

# then to run..

docker compose up


# ------------


