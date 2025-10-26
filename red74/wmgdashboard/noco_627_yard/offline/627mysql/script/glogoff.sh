#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array


date

mysql -uroot -p$MYSQL_ROOT_PASSWORD  -e "SET GLOBAL general_log = 0"

sleep 2

# name=1eda0c1ab545
# name=77c430a2c0d9
name=mysql-519

cd /in-out; 
cp /var/lib/mysql/$name.log general-log_$(date +"%Y-%m-%d_%H.%M.%S").log;
rm /var/lib/mysql/$name.log; 
chmod -R 777 general-log*.log ; 
chown -R  1000:1000 general-log*.log ; 
pwd; 
ls -l;

date


# sftp://albe@10.4.1.224/srv/dkr/mysql519/sysdata/mysqldata/77c430a2c0d9.log