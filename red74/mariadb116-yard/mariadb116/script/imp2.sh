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


# mysql -udg417 -p$pw -e "truncate table lukup.emp_enterprise"

echo 'msg-2020-05-29_Fri_19.53-PM'

# mysql --local-infile=1  -uroot -p"$MYSQL_ROOT_PASSWORD"</root/sh21.sql

sleep 2
 

patrn=''
# backup each database as follows..
dbarray=( 
/in-out/pmdsdata3-hrdb-regulr-mysql.2020-05-17_14.59.37.sql
/in-out/pmdsdata3-lukup-regulr-mysql.2020-05-17_14.59.54.sql

/in-out/pmdsdata3-argostat-regulr-mysql.2020-05-17_14.59.28.sql
/in-out/pmdsdata3-cilist-regulr-mysql.2020-05-17_14.59.28.sql
/in-out/pmdsdata3-cmmdb-regulr-mysql.2020-05-17_14.59.29.sql
/in-out/pmdsdata3-dgnote130-regulr-mysql.2020-05-17_14.59.35.sql
/in-out/pmdsdata3-dgnote130-regulr-mysql.sql
/in-out/pmdsdata3-dkrdbdev-regulr-mysql.2020-05-17_14.59.36.sql
/in-out/pmdsdata3-emptydb-regulr-mysql.2020-05-17_14.59.37.sql
/in-out/pmdsdata3-greygold-regulr-mysql.2020-05-17_15.25.52.sql
/in-out/pmdsdata3-hrdb_dev-regulr-mysql.2020-05-17_14.59.39.sql

/in-out/pmdsdata3-ignition-regulr-mysql.2020-05-17_14.59.40.sql
/in-out/pmdsdata3-leanmfg-regulr-mysql.2020-05-17_14.59.54.sql
/in-out/pmdsdata3-leanmfg-regulr-mysql.sql
/in-out/pmdsdata3-lukup_pub-regulr-mysql.2020-05-17_14.59.54.sql
/in-out/pmdsdata3-metabasedb-regulr-mysql.2020-05-17_14.59.54.sql
/in-out/pmdsdata3-mysql-regulr-mysql.2020-05-17_14.59.58.sql
/in-out/pmdsdata3-phpmyadmin-regulr-mysql.2020-05-17_14.59.58.sql
/in-out/pmdsdata3-prod367db-regulr-mysql.2020-05-17_14.59.59.sql
/in-out/pmdsdata3-prod367db-regulr-mysql.sql
/in-out/pmdsdata3-prodrptdb_archive-regulr-mysql.2020-05-17_15.25.58.sql
/in-out/pmdsdata3-prodrptdb-regulr-mysql.2020-05-17_15.00.01.sql
/in-out/pmdsdata3-prodrptdbtes2-regulr-mysql.2020-05-17_15.00.15.sql
/in-out/pmdsdata3-qadata-regulr-mysql.2020-05-17_15.00.15.sql
/in-out/pmdsdata3-qualitydb-regulr-mysql.2020-05-17_15.00.15.sql
/in-out/pmdsdata3-rail_test-regulr-mysql.2020-05-17_15.00.16.sql
/in-out/pmdsdata3-rptdb-regulr-mysql.2020-05-17_15.00.16.sql
/in-out/pmdsdata3-shiftcsd1-regulr-mysql.2020-05-17_15.00.17.sql
/in-out/pmdsdata3-shiftcsd1suprv-regulr-mysql.2020-05-17_15.00.20.sql
/in-out/pmdsdata3-shiftcsd2-regulr-mysql.2020-05-17_15.00.22.sql
/in-out/pmdsdata3-shiftcsd2suprv-regulr-mysql.2020-05-17_15.00.23.sql
/in-out/pmdsdata3-shift_smsmeer-regulr-mysql.2020-05-17_15.00.16.sql
/in-out/pmdsdata3-test2-regulr-mysql.2020-05-17_15.00.27.sql
/in-out/pmdsdata3-test-regulr-mysql.2020-05-17_15.00.26.sql
/in-out/pmdsdata3-webiddb-regulr-mysql.2020-05-17_15.00.27.sql
) 

date
for patrn in "${dbarray[@]}"
do
  echo "Processing $patrn file..."
  # take action on each file. $patrn store current file name
  echo $patrn
  mysql --local-infile=1 -uroot -p"$MYSQL_ROOT_PASSWORD"  < $patrn
done    
	


}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function notes()  
{
exit 999


}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


main1
date



	
