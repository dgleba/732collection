
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]22-38PM 

test

rsync -a -e ssh /home/albe/cur* albe@10.4.1.227:/home/file/frompd3/x1/


mysqyl indiv

rsync -av -e ssh /home/albe/backup/mysql_indiv/  albe@10.4.1.227:/home/file/frompd3/mysql0518/


# find |grep struc -exec rm {} \;
find . | grep struc | xargs rm -f


eg. rm folder name

find . -name ".svn" -type d -exec rm -r "{}" \;

try
find . -type d | xargs rm -rf



eg.
rsync --progress -av -e ssh /c/1 albe@10.4.1.227:/home/albe/rsynctest/1b



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]23-10PM 





#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@   no.
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]23-30PM 


no.
need order..
need lukup etc first...


#!/bin/bash
cd ; source shc/21env.sh
FILES=/home/file/frompd3/mysql0527/*
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  echo $f
  mysql -uroot -p$mysqlrootpassw  < $f
done





#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  stop..
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]23-26PM 


Processing /home/file/frompd3/mysql0527/pmdsdata3-argostat-regulr-mysql.2020-05-17_14.59.28.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-argostat-regulr-mysql.2020-05-17_14.59.28.sql
Processing /home/file/frompd3/mysql0527/pmdsdata3-cilist-regulr-mysql.2020-05-17_14.59.28.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-cilist-regulr-mysql.2020-05-17_14.59.28.sql
ERROR 1146 (42S02) at line 2418: Table 'lukup.emp_ceridian' doesn't exist
Processing /home/file/frompd3/mysql0527/pmdsdata3-cmmdb-regulr-mysql.2020-05-17_14.59.29.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-cmmdb-regulr-mysql.2020-05-17_14.59.29.sql
^CCtrl-C -- sending "KILL QUERY 221" to server ...
Ctrl-C -- query aborted.
ERROR 1317 (70100) at line 270: Query execution was interrupted
Processing /home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.2020-05-17_14.59.35.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.2020-05-17_14.59.35.sql
^CCtrl-C -- sending "KILL QUERY 228" to server ...
Ctrl-C -- query aborted.
^CCtrl-C -- sending "KILL QUERY 228" to server ...
Ctrl-C -- query aborted.
Processing /home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.sql
^CCtrl-C -- sending "KILL QUERY 231" to server ...
Ctrl-C -- query aborted.
ERROR 1317 (70100) at line 22: Query execution was interrupted
Processing /home/file/frompd3/mysql0527/pmdsdata3-dkrdbdev-regulr-mysql.2020-05-17_14.59.36.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-dkrdbdev-regulr-mysql.2020-05-17_14.59.36.sql
^CCtrl-C -- sending "KILL QUERY 233" to server ...
Ctrl-C -- query aborted.
^CCtrl-C -- sending "KILL 233" to server ...
Ctrl-C -- query aborted.
ERROR 2013 (HY000) at line 144: Lost connection to MySQL server during query
Processing /home/file/frompd3/mysql0527/pmdsdata3-emptydb-regulr-mysql.2020-05-17_14.59.37.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-emptydb-regulr-mysql.2020-05-17_14.59.37.sql
^CCtrl-C -- sending "KILL QUERY 236" to server ...
Ctrl-C -- query aborted.
Processing /home/file/frompd3/mysql0527/pmdsdata3-greygold-regulr-mysql.2020-05-17_15.25.52.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-greygold-regulr-mysql.2020-05-17_15.25.52.sql

'


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  import
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]23-31PM 


FILES=/home/file/frompd3/mysql0527/*
find $FILES




patrn=''
# backup each database as follows..
dbarray=( 
/home/file/frompd3/mysql0527/pmdsdata3-hrdb-regulr-mysql.2020-05-17_14.59.37.sql
/home/file/frompd3/mysql0527/pmdsdata3-lukup-regulr-mysql.2020-05-17_14.59.54.sql

/home/file/frompd3/mysql0527/pmdsdata3-argostat-regulr-mysql.2020-05-17_14.59.28.sql
/home/file/frompd3/mysql0527/pmdsdata3-cilist-regulr-mysql.2020-05-17_14.59.28.sql
/home/file/frompd3/mysql0527/pmdsdata3-cmmdb-regulr-mysql.2020-05-17_14.59.29.sql
/home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.2020-05-17_14.59.35.sql
/home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.sql
/home/file/frompd3/mysql0527/pmdsdata3-dkrdbdev-regulr-mysql.2020-05-17_14.59.36.sql
/home/file/frompd3/mysql0527/pmdsdata3-emptydb-regulr-mysql.2020-05-17_14.59.37.sql
/home/file/frompd3/mysql0527/pmdsdata3-greygold-regulr-mysql.2020-05-17_15.25.52.sql
/home/file/frompd3/mysql0527/pmdsdata3-hrdb_dev-regulr-mysql.2020-05-17_14.59.39.sql

/home/file/frompd3/mysql0527/pmdsdata3-ignition-regulr-mysql.2020-05-17_14.59.40.sql
/home/file/frompd3/mysql0527/pmdsdata3-leanmfg-regulr-mysql.2020-05-17_14.59.54.sql
/home/file/frompd3/mysql0527/pmdsdata3-leanmfg-regulr-mysql.sql
/home/file/frompd3/mysql0527/pmdsdata3-lukup_pub-regulr-mysql.2020-05-17_14.59.54.sql
/home/file/frompd3/mysql0527/pmdsdata3-metabasedb-regulr-mysql.2020-05-17_14.59.54.sql
/home/file/frompd3/mysql0527/pmdsdata3-mysql-regulr-mysql.2020-05-17_14.59.58.sql
/home/file/frompd3/mysql0527/pmdsdata3-phpmyadmin-regulr-mysql.2020-05-17_14.59.58.sql
/home/file/frompd3/mysql0527/pmdsdata3-prod367db-regulr-mysql.2020-05-17_14.59.59.sql
/home/file/frompd3/mysql0527/pmdsdata3-prod367db-regulr-mysql.sql
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdb_archive-regulr-mysql.2020-05-17_15.25.58.sql
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdb-regulr-mysql.2020-05-17_15.00.01.sql
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdbtes2-regulr-mysql.2020-05-17_15.00.15.sql
/home/file/frompd3/mysql0527/pmdsdata3-qadata-regulr-mysql.2020-05-17_15.00.15.sql
/home/file/frompd3/mysql0527/pmdsdata3-qualitydb-regulr-mysql.2020-05-17_15.00.15.sql
/home/file/frompd3/mysql0527/pmdsdata3-rail_test-regulr-mysql.2020-05-17_15.00.16.sql
/home/file/frompd3/mysql0527/pmdsdata3-rptdb-regulr-mysql.2020-05-17_15.00.16.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1-regulr-mysql.2020-05-17_15.00.17.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1suprv-regulr-mysql.2020-05-17_15.00.20.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2-regulr-mysql.2020-05-17_15.00.22.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2suprv-regulr-mysql.2020-05-17_15.00.23.sql
/home/file/frompd3/mysql0527/pmdsdata3-shift_smsmeer-regulr-mysql.2020-05-17_15.00.16.sql
/home/file/frompd3/mysql0527/pmdsdata3-test2-regulr-mysql.2020-05-17_15.00.27.sql
/home/file/frompd3/mysql0527/pmdsdata3-test-regulr-mysql.2020-05-17_15.00.26.sql
/home/file/frompd3/mysql0527/pmdsdata3-webiddb-regulr-mysql.2020-05-17_15.00.27.sql
) 
 
sleep 2
 
date
for patrn in "${dbarray[@]}"
do
  echo "Processing $patrn file..."
  # take action on each file. $patrn store current file name
  echo $patrn
  mysql -uroot -p$mysqlrootpassw  < $patrn
done    
	
	
	

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]23-49PM 

start
Thu May 28 23:41:21 EDT 2020
albe@pmdsdata4:~$ for patrn in "${dbarray[@]}"



/home/file/frompd3/mysql0527/pmdsdata3-prod367db-regulr-mysql.sql
Processing /home/file/frompd3/mysql0527/pmdsdata3-prodrptdb_archive-regulr-mysql.2020-05-17_15.25.58.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdb_archive-regulr-mysql.2020-05-17_15.25.58.sql
ERROR 1114 (HY000) at line 467: The table 'tkb_prodtrak2_offline308' is full
Processing /home/file/frompd3/mysql0527/pmdsdata3-prodrptdb-regulr-mysql.2020-05-17_15.00.01.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdb-regulr-mysql.2020-05-17_15.00.01.sql
ERROR 1006 (HY000) at line 24: Can't create database 'prodrptdb' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-prodrptdbtes2-regulr-mysql.2020-05-17_15.00.15.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdbtes2-regulr-mysql.2020-05-17_15.00.15.sql
ERROR 1006 (HY000) at line 24: Can't create database 'prodrptdbtes2' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-qadata-regulr-mysql.2020-05-17_15.00.15.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-qadata-regulr-mysql.2020-05-17_15.00.15.sql
ERROR 1006 (HY000) at line 24: Can't create database 'qadata' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-qualitydb-regulr-mysql.2020-05-17_15.00.15.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-qualitydb-regulr-mysql.2020-05-17_15.00.15.sql
ERROR 1006 (HY000) at line 24: Can't create database 'qualitydb' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-rail_test-regulr-mysql.2020-05-17_15.00.16.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-rail_test-regulr-mysql.2020-05-17_15.00.16.sql
ERROR 1006 (HY000) at line 24: Can't create database 'rail_test' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-rptdb-regulr-mysql.2020-05-17_15.00.16.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-rptdb-regulr-mysql.2020-05-17_15.00.16.sql
ERROR 1006 (HY000) at line 24: Can't create database 'rptdb' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1-regulr-mysql.2020-05-17_15.00.17.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1-regulr-mysql.2020-05-17_15.00.17.sql
ERROR 1006 (HY000) at line 24: Can't create database 'shiftcsd1' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1suprv-regulr-mysql.2020-05-17_15.00.20.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1suprv-regulr-mysql.2020-05-17_15.00.20.sql
ERROR 1006 (HY000) at line 24: Can't create database 'shiftcsd1suprv' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2-regulr-mysql.2020-05-17_15.00.22.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2-regulr-mysql.2020-05-17_15.00.22.sql
ERROR 1006 (HY000) at line 24: Can't create database 'shiftcsd2' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2suprv-regulr-mysql.2020-05-17_15.00.23.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2suprv-regulr-mysql.2020-05-17_15.00.23.sql
ERROR 1006 (HY000) at line 24: Can't create database 'shiftcsd2suprv' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-shift_smsmeer-regulr-mysql.2020-05-17_15.00.16.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-shift_smsmeer-regulr-mysql.2020-05-17_15.00.16.sql
ERROR 1006 (HY000) at line 24: Can't create database 'shift_smsmeer' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-test2-regulr-mysql.2020-05-17_15.00.27.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-test2-regulr-mysql.2020-05-17_15.00.27.sql
ERROR 1006 (HY000) at line 24: Can't create database 'test2' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-test-regulr-mysql.2020-05-17_15.00.26.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-test-regulr-mysql.2020-05-17_15.00.26.sql
ERROR 1006 (HY000) at line 24: Can't create database 'test' (errno: 28)
Processing /home/file/frompd3/mysql0527/pmdsdata3-webiddb-regulr-mysql.2020-05-17_15.00.27.sql file...
/home/file/frompd3/mysql0527/pmdsdata3-webiddb-regulr-mysql.2020-05-17_15.00.27.sql
ERROR 1006 (HY000) at line 24: Can't create database 'webiddb' (errno: 28)
albe@pmdsdata4:~$
albe@pmdsdata4:~$ daate
dtNo command 'daate' found, did you mean:
 Command 'date' from package 'coreutils' (main)
 Command 'ddate' from package 'util-linux' (main)
daate: command not found
albe@pmdsdata4:~$ date
Thu May 28 23:55:22 EDT 2020
albe@pmdsdata4:~$
	



 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 #@  
 #@  
 #@  
 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-30[May-Sat]16-35PM 


 albe@pmdsdata7:/srv/file/test/482dkrcollection/mysql-pd3tst/sysdata$ find ./in-out
./in-out
./in-out/pmdsdata3-emptydb-regulr-mysql.sql
./in-out/pmdsdata3-lukup-regulr-mysql.sql
./in-out/pmdsdata3-cilist-regulr-mysql.sql
./in-out/pmdsdata3-dkrdbdev-regulr-mysql.sql
./in-out/pmdsdata3-webiddb-regulr-mysql.sql
./in-out/pmdsdata3-prodrptdb_archive-regulr-mysql.sql
./in-out/pmdsdata3-qadata-regulr-mysql.sql
./in-out/pmdsdata3-rail_test-regulr-mysql.sql
./in-out/pmdsdata3-hrdb-regulr-mysql.sql
./in-out/pmdsdata3-rptdb-regulr-mysql.sql
./in-out/pmdsdata3-lukup_pub-regulr-mysql.sql
./in-out/pmdsdata3-dgnote130-regulr-mysql.sql
./in-out/pmdsdata3-shiftcsd2suprv-regulr-mysql.sql
./in-out/pmdsdata3-qualitydb-regulr-mysql.sql
./in-out/pmdsdata3-leanmfg-regulr-mysql.sql
./in-out/pmdsdata3-prod367db-regulr-mysql.sql
./in-out/pmdsdata3-shiftcsd2-regulr-mysql.sql
./in-out/pmdsdata3-shiftcsd1-regulr-mysql.sql
./in-out/pmdsdata3-hrdb_dev-regulr-mysql.sql
./in-out/pmdsdata3-shiftcsd1suprv-regulr-mysql.sql
./in-out/pmdsdata3-phpmyadmin-regulr-mysql.sql
./in-out/pmdsdata3-shift_smsmeer-regulr-mysql.sql
./in-out/pmdsdata3-test-regulr-mysql.sql
./in-out/pmdsdata3-ignition-regulr-mysql.sql
./in-out/pmdsdata3-greygold-regulr-mysql.sql
./in-out/pmdsdata3-metabasedb-regulr-mysql.sql
./in-out/pmdsdata3-cmmdb-regulr-mysql.sql
./in-out/pmdsdata3-argostat-regulr-mysql.sql
./in-out/pmdsdata3-prodrptdbtes2-regulr-mysql.sql
./in-out/pmdsdata3-prodrptdb-regulr-mysql.sql
./in-out/pmdsdata3-test2-regulr-mysql.sql
 



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  change all to myisam  - loose foreign keys
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-29[May-Fri]23-47PM 


ALTER TABLE cilist.`users_rr` ENGINE=MyISAM
Error in query (1217): Cannot delete or update a parent row: a foreign key constraint fails


may have to remove all FOREIGN KEYs



SET FOREIGN_KEY_CHECKS=0;

SELECT  CONCAT('SET FOREIGN_KEY_CHECKS=0; ALTER TABLE ',TABLE_SCHEMA,'.','`', table_name, '`', ' ENGINE=MyISAM;') AS sql_statements
FROM    information_schema.tables
WHERE   TABLE_SCHEMA NOT IN ( 'tmp')
AND     `ENGINE` = 'InnoDB'
AND     `TABLE_TYPE` = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, table_name DESC;


SET FOREIGN_KEY_CHECKS=1;



2.

SELECT  CONCAT('ALTER TABLE ',TABLE_SCHEMA,'.', table_name, ' ENGINE=InnoDB;') AS sql_statements
FROM    information_schema.tables
WHERE   TABLE_SCHEMA NOT IN ('mysql', 'information_schema', 'performance_schema', 'innodb', 'sys', 'tmp')
AND     `ENGINE` = 'MyISAM'
AND     `TABLE_TYPE` = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, table_name DESC;




#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-31[May-Sun]14-28PM 



 
 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 #@  
 #@  https://vdachev.net/2007/02/22/mysql-reducing-ibdata1/
 #@  
 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-31[May-Sun]14-27PM 


 Dump the Whole Database
In fact, this is the method I used to solve the problem. It requires much more space and time but it’s maybe the easiest one. So here it is:

Dump all databases by calling:
1
mysqldump --extended-insert --all-databases --add-drop-database --disable-keys --flush-privileges --quick --routines --triggers > 'all-databases.sql'

Stop the MySQL server;

Rename or remove (in case you’ve already backed it up) the MySQL data directory and create an empty one with the same name and permissions;

Add the innodb_file_per_table option to your my.cnf;

Re-initialize the database with the following command (replace the ‘mysqld‘ with the login of the user your MySQL server runs as) (10x, Påven):
1
sudo -u mysqld mysql_install_db
Start the MySQL server;
Get into the MySQL console and type:
1
2
3
SET FOREIGN_KEY_CHECKS=0;
SOURCE 'all-databases.sql';
SET FOREIGN_KEY_CHECKS=1;
Restart the MySQL server. (10x, czaby)
At this point everything should be fine and you can test it by starting again the services that use MySQL. If not…



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-31[May-Sun]14-29PM 






#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]22-38PM 


rsync -av -e ssh /home/albe/backup/mysql_indiv/  albe@10.4.1.227:/home/file/frompd3/mysql0518/


tmpf1='/tmp/rsyncfiles'
  find . -type f |grep regulr > $tmpf1 # files.
  rsync -av -e ssh --files-from=$tmpf1 /home/albe/backup/mysql_indiv/  albe@10.4.1.228:/srv/file/test/482dkrcollection/mysql-pd3tst/sysdata/in-out



# sftp://10.4.1.228/srv/file/test/482dkrcollection/mysql-pd3tst/sysdata/in-out


# find |grep struc -exec rm {} \;
cd sysdata/in-out
find . | grep struc | xargs rm -f



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  import
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]23-31PM 


FILES=/home/file/frompd3/mysql0527/*
find $FILES




patrn=''
# backup each database as follows..
dbarray=( 
/home/file/frompd3/mysql0527/pmdsdata3-hrdb-regulr-mysql.2020-05-17_14.59.37.sql
/home/file/frompd3/mysql0527/pmdsdata3-lukup-regulr-mysql.2020-05-17_14.59.54.sql

/home/file/frompd3/mysql0527/pmdsdata3-argostat-regulr-mysql.2020-05-17_14.59.28.sql
/home/file/frompd3/mysql0527/pmdsdata3-cilist-regulr-mysql.2020-05-17_14.59.28.sql
/home/file/frompd3/mysql0527/pmdsdata3-cmmdb-regulr-mysql.2020-05-17_14.59.29.sql
/home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.2020-05-17_14.59.35.sql
/home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.sql
/home/file/frompd3/mysql0527/pmdsdata3-dkrdbdev-regulr-mysql.2020-05-17_14.59.36.sql
/home/file/frompd3/mysql0527/pmdsdata3-emptydb-regulr-mysql.2020-05-17_14.59.37.sql
/home/file/frompd3/mysql0527/pmdsdata3-greygold-regulr-mysql.2020-05-17_15.25.52.sql
/home/file/frompd3/mysql0527/pmdsdata3-hrdb_dev-regulr-mysql.2020-05-17_14.59.39.sql

/home/file/frompd3/mysql0527/pmdsdata3-ignition-regulr-mysql.2020-05-17_14.59.40.sql
/home/file/frompd3/mysql0527/pmdsdata3-leanmfg-regulr-mysql.2020-05-17_14.59.54.sql
/home/file/frompd3/mysql0527/pmdsdata3-leanmfg-regulr-mysql.sql
/home/file/frompd3/mysql0527/pmdsdata3-lukup_pub-regulr-mysql.2020-05-17_14.59.54.sql
/home/file/frompd3/mysql0527/pmdsdata3-metabasedb-regulr-mysql.2020-05-17_14.59.54.sql
/home/file/frompd3/mysql0527/pmdsdata3-mysql-regulr-mysql.2020-05-17_14.59.58.sql
/home/file/frompd3/mysql0527/pmdsdata3-phpmyadmin-regulr-mysql.2020-05-17_14.59.58.sql
/home/file/frompd3/mysql0527/pmdsdata3-prod367db-regulr-mysql.2020-05-17_14.59.59.sql
/home/file/frompd3/mysql0527/pmdsdata3-prod367db-regulr-mysql.sql
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdb_archive-regulr-mysql.2020-05-17_15.25.58.sql
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdb-regulr-mysql.2020-05-17_15.00.01.sql
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdbtes2-regulr-mysql.2020-05-17_15.00.15.sql
/home/file/frompd3/mysql0527/pmdsdata3-qadata-regulr-mysql.2020-05-17_15.00.15.sql
/home/file/frompd3/mysql0527/pmdsdata3-qualitydb-regulr-mysql.2020-05-17_15.00.15.sql
/home/file/frompd3/mysql0527/pmdsdata3-rail_test-regulr-mysql.2020-05-17_15.00.16.sql
/home/file/frompd3/mysql0527/pmdsdata3-rptdb-regulr-mysql.2020-05-17_15.00.16.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1-regulr-mysql.2020-05-17_15.00.17.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1suprv-regulr-mysql.2020-05-17_15.00.20.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2-regulr-mysql.2020-05-17_15.00.22.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2suprv-regulr-mysql.2020-05-17_15.00.23.sql
/home/file/frompd3/mysql0527/pmdsdata3-shift_smsmeer-regulr-mysql.2020-05-17_15.00.16.sql
/home/file/frompd3/mysql0527/pmdsdata3-test2-regulr-mysql.2020-05-17_15.00.27.sql
/home/file/frompd3/mysql0527/pmdsdata3-test-regulr-mysql.2020-05-17_15.00.26.sql
/home/file/frompd3/mysql0527/pmdsdata3-webiddb-regulr-mysql.2020-05-17_15.00.27.sql
) 
 
sleep 2
 
date
for patrn in "${dbarray[@]}"
do
  echo "Processing $patrn file..."
  # take action on each file. $patrn store current file name
  echo $patrn
  mysql -uroot -p$mysqlrootpassw  < $patrn
done    
	
	
	

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




#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-04[Jun-Thu]14-23PM 


