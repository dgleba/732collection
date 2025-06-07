#!/usr/bin/env bash
date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array


# Purpose:  Compare mysql519 now to previous

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
lukup
)

mkdir -p /in-out/comp-c4

date
for patrn in "${dbarray[@]}"
do
  # dump regular 
  mysqldump --user=root --password=$MYSQL_ROOT_PASSWORD --databases $patrn    \
    --compact --skip-comments --skip-extended-insert --routines --events --flush-privileges  | grep -v 'SQL SECURITY DEFINER' | sed -e "s/\r//g"   > /in-out/comp-c4/m519-$patrn-4comparedb-mysql.sql
  date
done
}




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function notes()  
{
exit 999
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function main1() 
{
set -vx

# uncomment the following for what you want to import
expocomparedb

}


main1
date


