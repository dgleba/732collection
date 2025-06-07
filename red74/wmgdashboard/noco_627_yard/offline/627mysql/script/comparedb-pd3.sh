#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array



function expocomparedb()  
{
# backup each database as follows..
dbarray=( 
cilist
hrdb
leanmfg
lukup
lukup_pub
mysql
metabasedb
prod367db
prodrptdb
qualitydb
rptdb
qadata
shift_smsmeer
shiftcsd1
shiftcsd1suprv
shiftcsd2
shiftcsd2suprv
) 

dbarray_notbackingup=( 
x
)

set +vx && source ./.env ; set -vx


dblist=(`mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "SHOW DATABASES;" | grep -Ev \
   "(Database|mysql|information_schema|performance_schema)"`)   # see exclude list to the left on this line.
   
echo $dblist
echo dblistarray..
echo ${dblist[*]}
echo dbarray..
echo ${dbarray[*]}
 
#sleep 2
mkdir -p ./sysdata/in-out/comp-pd3

date
for patrn in "${dbarray[@]}"
do
  # dump regular 
  # Strip dos line endings with this.. sed -e "s/\r//g" 
  # this is confusing. don;t use it... `mysqldump --protocol=TCP`  use --host=127.0.0.1 --port=3308
  mysqldump --host=127.0.0.1 --port=3308 --user=root --password=$MYSQL_ROOT_PASSWORD --databases $patrn    \
    --compact --skip-comments --skip-extended-insert --routines --events --flush-privileges  | grep -v 'SQL SECURITY DEFINER' | sed -e "s/\r//g"  > ./sysdata/in-out/comp-pd3/pd3-$patrn-4comparedb-mysql.sql
  date
done
}



function compareexp1()  
{

# example from .. https://stackoverflow.com/questions/225772/compare-two-mysql-databases

echo "Usage: dbdiff [user1:pass1@dbname1] [user2:pass2@dbname2] [ignore_table1:ignore_table2...]"

dump () {
  up=${1%%@*}; user=${up%%:*}; pass=${up##*:}; dbname=${1##*@};
  mysqldump --opt --compact --skip-extended-insert -u $user -p$pass $dbname $table > $2
}

rm -f /tmp/db.diff

# Compare
up=${1%%@*}; user=${up%%:*}; pass=${up##*:}; dbname=${1##*@};
for table in `mysql -u $user -p$pass $dbname -N -e "show tables" --batch`; do
  if [ "`echo $3 | grep $table`" = "" ]; then
    echo "Comparing '$table'..."
    dump $1 /tmp/file1.sql
    dump $2 /tmp/file2.sql
    diff -up /tmp/file1.sql /tmp/file2.sql >> /tmp/db.diff
  else
    echo "Ignored '$table'..."
  fi
done
less /tmp/db.diff
rm -f /tmp/file1.sql /tmp/file2.sql
}






#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function notes()  
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
#sleep 2

# uncomment the following for what you want to import

expocomparedb

}



main1
date


