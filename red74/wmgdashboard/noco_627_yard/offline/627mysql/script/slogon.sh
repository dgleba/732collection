#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
# set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array




date

mysql -uroot -p$MYSQL_ROOT_PASSWORD  -e "SET GLOBAL slow_query_log  = 1"

#name=1eda0c1ab545
name=mysql-519
# chmod  775 /var/lib/mysql/*.log ; 
chmod -R 775 /var/lib/mysql/"$name"-slow.log ; 


date
