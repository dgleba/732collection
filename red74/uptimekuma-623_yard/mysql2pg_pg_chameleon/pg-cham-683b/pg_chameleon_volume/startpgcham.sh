#!/bin/bash

echo 'pgcham starting command after sleeping n seconds..' ; 
set -vx; 
sleep 10 ;
echo 'Generating config.yml from template...'; 
envsubst < /home/chameleon/.pg_chameleon/configuration/default-template.yml  > /home/chameleon/.pg_chameleon/configuration/default.yml;
echo '1. set conf...';  chameleon set_configuration_files;
echo '2..';  chameleon create_replica_schema --debug ;
echo '3..';  chameleon add_source --config default  --debug --source dba ;
echo '4..';  chameleon init_replica --config default --debug --source dba ;
echo '5..';  chameleon start_replica --config default --source dba ;
tail -f ~/.pg_chameleon/logs/*.log;

