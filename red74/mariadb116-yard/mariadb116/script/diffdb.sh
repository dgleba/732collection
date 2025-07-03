#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array



function diffdb()  
{
dbarray=( 
leanmfg
cilist
hrdb
lukup
lukup_pub
mysql
prodrptdb
prod367db
) 

date
for patrn in "${dbarray[@]}"
do
  echo "Processing $patrn file..."
  # take action on each file. $patrn store current file name
  # mysql --local-infile=1 -uroot -p"$MYSQL_ROOT_PASSWORD"  < $patrn
  diff -up /home/albe/backup/mysql_indiv/pmdsdata3-$patrn-regulr-mysql.sql /srv/dkr/mysql519/sysdata/in-out/pmdsdata3-$patrn-regulr-mysql.sql | tee -a /tmp/db.diff
  #diff -up /home/albe/backup/mysql_indiv/pmdsdata3-$patrn-regulr-mysql.sql /srv/dkr/mysql519/sysdata/in-out/compr/m519-$patrn-4comparedb-mysql.sql | tee -a /tmp/db.diff
  date
done
}





#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function notes()  
{
exit 999

# mysql -udg417 -p$pw -e "truncate table lukup.emp_enterprise"

echo 'msg-2020-05-29_Fri_19.53-PM'

# mysql --local-infile=1  -uroot -p"$MYSQL_ROOT_PASSWORD"</root/sh21.sql

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





function main1() 
{
set -vx

# usage: see makefile

echo 'msg-2020-05-29_Fri_19.53-PM'

sleep 2

# uncomment the following for what you want to import

diffdb

}



main1
date


