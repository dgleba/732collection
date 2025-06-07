#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array



function priv()  
{
# backup each database as follows..
dbarray=( 
leanmfg
prodrptdb
prod367db
qualitydb
shift_smsmeer
shiftcsd1
shiftcsd1suprv
shiftcsd2
shiftcsd2suprv
) 

dbarray_notbackingup=( 
rptdb
qadata
lukup_pub
mysql
metabasedb
cilist
hrdb
lukup
)

date
for patrn in "${dbarray[@]}"
do
  mysql -uroot -p$MYSQL_ROOT_PASSWORD  -e "GRANT ALL PRIVILEGES ON $patrn.* TO 'dg417'@'%' ;flush PRIVILEGES"

  #mysqlDUMP  --user=root --password=$MYSQL_ROOT_PASSWORD --databases $patrn    \
  #  --compact --skip-comments --skip-extended-insert --routines --events --flush-privileges  | grep -v 'SQL SECURITY DEFINER' | sed -e "s/\r//g"   > /in-out/compr/m519-$patrn-4comparedb-mysql.sql
  date
done

 
mysql -uroot -p$MYSQL_ROOT_PASSWORD  -e "GRANT ALL PRIVILEGES ON hrdb.* TO 'hruser'@'%' ;flush PRIVILEGES"
mysql -uroot -p$MYSQL_ROOT_PASSWORD  -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'phpmyadmin'@'%' ;flush PRIVILEGES"
mysql -uroot -p$MYSQL_ROOT_PASSWORD  -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'dg417'@'%' ;flush PRIVILEGES"

mysql -uroot -p$MYSQL_ROOT_PASSWORD  -e "revoke ALL PRIVILEGES ON metabasedb.* from 'stuser'@'%' ;flush PRIVILEGES"
mysql -uroot -p$MYSQL_ROOT_PASSWORD  -e "GRANT ALL PRIVILEGES ON metabasedb.* TO 'sysuser'@'%' ;flush PRIVILEGES"

mysql -uroot -p$mysqlrootpassw  -e "CREATE USER 'sysuser'@'%' IDENTIFIED BY '$mysql_lukup_pass';"


}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function NOTES____notes()  
{
exit 999
# mysql -udg417 -p$pw -e "truncate table lukup.emp_enterprise"
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



function main1() 
{
set -vx

# usage: see makefile

echo 'msg-2020-05-29_Fri_19.53-PM'

# uncomment the following for what you want to import

priv

}


main1
date


