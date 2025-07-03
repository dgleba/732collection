#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array

remove-warning () {
    grep -v 'insecure.'
}

function main1() 
{

# usage: see makefile

# mysql -udg417 -p$pw -e "truncate table lukup.emp_enterprise"

echo 'msg-2018-09-29a'


cat <<EOF > /root/tmp.sql
use dkrdb;
CREATE  TABLE if not exists data1 
(
  id         bigint(20) NOT NULL      AUTO_INCREMENT,
  datetime   timestamp  NULL          DEFAULT CURRENT_TIMESTAMP,
  channel    int(11)                  DEFAULT NULL,
  value      float                    DEFAULT NULL,
  note varchar(2323) DEFAULT NULL,
  PRIMARY KEY (id)
);
CREATE  TABLE if not exists data1_archive 
(
  id         bigint(20) NOT NULL      AUTO_INCREMENT,
  datetime   timestamp  NULL          DEFAULT CURRENT_TIMESTAMP,
  channel    int(11)                  DEFAULT NULL,
  value      float                    DEFAULT NULL,
  note varchar(2323) DEFAULT NULL,
  PRIMARY KEY (id)
);
--
EOF


#sleep 1

mysql --local-infile=1  -uroot -p"$MYSQL_ROOT_PASSWORD"</root/tmp.sql

date
i=0
j=0
echo count one for each 100 rows..
for j in {1..5} 
  do
  echo $j
    for i in {1..100} 
      do
        mysql -uroot -p$MYSQL_ROOT_PASSWORD   -e "INSERT INTO data1 (channel) VALUES ( $i );" dkrdb 2>&1 | remove-warning
        # no worky .. if [[ $i/100  = 1 ]] ; then echo $1; fi
      done
  done    
date

timeout1=55 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


# mysqldump -uroot -p$MYSQL_ROOT_PASSWORD   dkrdb data1 --no-create-info --where='id>=1' | sed -e "s/([0-9]*,/(NULL,/gi" > /root/export.data1.sql
# mysqldump -e <database> | sed 's/^CREATE TABLE /CREATE TABLE IF NOT EXISTS /' > <database>.sql 
echo "USE dkrdb" >> /root/export.data1.sql
mysqldump -uroot -p$MYSQL_ROOT_PASSWORD   dkrdb data1   --skip-add-drop-table    --where='id>=1' | sed -e "s/([0-9]*,/(NULL,/gi" \
   | sed 's/^CREATE TABLE /CREATE TABLE IF NOT EXISTS /' >> /root/export.data1.sql


timeout12=59 ; read -t "${timeout12}" -p "Press ENTER or wait $timeout12 seconds..." || true ;  echo ;

i=0
echo import 10 times..
    for i in {1..100} 
      do
        mysql --local-infile=1  -uroot -p"$MYSQL_ROOT_PASSWORD"</root/export.data1.sql
      done
date
}




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function notes()  
{
exit 999

NOTES

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

date
main1
date
