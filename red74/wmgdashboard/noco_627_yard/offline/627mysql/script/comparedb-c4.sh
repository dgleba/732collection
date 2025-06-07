#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array


function comparedb()  
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
ignition
greygold
dgnote130
prodrptdb_archive
information_schema
performance_schema
argostat
dgnote130
dkrdb
dkrdbdev
emptydb
hrdb_dev
phpmyadmin
prodrptdbtes2
rail_test
test
test2
webiddb
)

set +vx && source ./.env
set -vx

date
for patrn in "${dbarray[@]}"
do
  # dump regular 
  diff -up ./sysdata/in-out/comp-c4/m519-$patrn-4comparedb-mysql.sql ./sysdata/in-out/compr/m519-$patrn-4comparedb-mysql.sql |cat -t |tee  x/comparedb-$patrn.txt
  date
done
}


function main1() 
{
set -vx

# usage: see makefile

# uncomment the following for what you want to import

comparedb

}


main1
date


