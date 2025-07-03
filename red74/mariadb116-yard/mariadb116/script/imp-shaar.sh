#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array


function main1() 
{
set -vx

# usage: see makefile

echo 'msg-paradisehil'

sleep 2


mysql --local-infile=1 -uroot -p"$MYSQL_ROOT_PASSWORD"  < /crib/convertcsv.sql

# mysql --local-infile=1 -uroot -p"$MYSQL_ROOT_PASSWORD"  < /crib/konbert-s1-sed-1row - this is useless    .sql

# mysql --local-infile=1 -uroot -p"$MYSQL_ROOT_PASSWORD"  < /script/imp-shaarli.sql


}




#=================================================

# It starts here

main1
date


