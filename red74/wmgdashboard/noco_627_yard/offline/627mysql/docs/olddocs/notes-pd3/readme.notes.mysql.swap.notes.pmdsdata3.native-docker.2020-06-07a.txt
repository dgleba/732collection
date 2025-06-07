



my notes from 2020-06-07 the sunday it was swaped.





#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  summary..  change port, socket, 
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]10-37AM 

see more in this file below for more info..


summary..


change /etc/my.cnf - port and socket
change /etc/debian.cnf - socket
change /etc/apparmor.d/local/usr.sbin.mysqld

change localhost to 127.0.01 in many apps. see below

change priviliges in mysql with make prv - sftp://10.4.1.224/srv/dkr/mysql519/privi519.sh
	change priv in docker new system. add % priv where there were only localhost.

change host in sftp://albe@10.4.1.224/home/albe/bin/metabase_start1.sh  from localhost to 127.0.01





#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  add
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]10-50AM 


/in-out/pmdsdata3-prodrptdb_archive-struc-mysql.sql


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  did not help
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]10-50AM 



heck permissions on /usr/local/mysql and /tmp. The need to be 775 at minimum. 2. Permission for the mysql database directory under /var/lib/ folder should be mysql:root (chown mysql:root mysql)

sudo su
cd /var/lib/
chown mysql:root mysql



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  apparmor.d
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]10-34AM 

https://askubuntu.com/questions/234668/cant-start-mysql-server-if-the-sock-file-is-changed-in-etc-mysql-my-cnf


/var/run/mysqld/mysqld1.sock w,


To allow this, add a file /etc/apparmor.d/local/usr.sbin.mysqld with the entry below, and restart MySQL.

/var/run/mysqld/mysqld1.sock w,


ref.
https://bugs.launchpad.net/ubuntu/+source/mysql-5.1/+bug/876268/comments/2



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  use tcp
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]10-50AM 

use this 
	mysql  --host=10.4.1.224 --port=3308 -u dg417 -pdg
not
	mysql --protocol=TCP -u root -p
		THis is ambiguous and confusing.
		
		


albe@pmdsdata3:/etc/mysql$ mysql --protocol=TCP -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 59
Server version: 5.5.62-0ubuntu0.14.04.1 (Ubuntu)

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| a_this_pd3         |
| argostat           |
| cilist             |
| cmmdb              |
| dgnote130          |
| dkrdbdev           |
| emptydb            |
| greygold           |
| hrdb               |
| hrdb_dev           |
| ignition           |
| leanmfg            |
| lukup              |
| lukup_pub          |
| metabasedb         |
| mysql              |
| performance_schema |
| phpmyadmin         |
| prod367db          |
| prodrptdb          |
| prodrptdb_archive  |
| prodrptdbtes2      |
| qadata             |
| qualitydb          |
| rail_test          |
| rptdb              |
| shift_smsmeer      |
| shiftcsd1          |
| shiftcsd1suprv     |
| shiftcsd2          |
| shiftcsd2suprv     |
| test               |
| test2              |
| webiddb            |
+--------------------+
35 rows in set (0.00 sec)

mysql>


_____________


https://serverfault.com/questions/306421/why-does-the-mysql-command-line-tool-ignore-the-port-parameter

albe@pmdsdata3:/etc/mysql$  mysql  --host=127.0.0.1 --port=3308 -u root -p

mysql  --host=10.4.1.224 --port=3308 -u dg417 -pdg

mysql  --host=127.0.0.1 --port=3308 -u dg417 -pdg


albe@pmdsdata3:~$  mysql  --host=10.4.1.224 --port=3308 -u dg417 -pdg
ERROR 2003 (HY000): Can't connect to MySQL server on '10.4.1.224' (111)
albe@pmdsdata3:~$



mysql  --host=127.0.0.1 --port=3306 -u dg417 -pdg
mysql  --host=127.0.0.1  -u dg417 -pdg
mysql   -u dg417 -pdg -- gives error. use above.



albe@pmdsdata3:/srv/dkr/mysql519$ mysql  --host=127.0.0.1 --port=3306 -u dg417 -pdg
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1620
Server version: 5.5.62 MySQL Community Server (GPL)

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| leanmfg            |
| lukup_pub          |
| prod367db          |
| prodrptdb          |
| qualitydb          |
| shift_smsmeer      |
| shiftcsd1          |
| shiftcsd1suprv     |
| shiftcsd2          |
| shiftcsd2suprv     |
+--------------------+
11 rows in set (0.00 sec)

mysql>


albe@pmdsdata3:/srv/dkr/mysql519$ mysql  --host=127.0.0.1 --port=3308 -u dg417 -pdg
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 120
Server version: 5.5.62-0ubuntu0.14.04.1 (Ubuntu)

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| a_this_pd3         |
| dgnote130          |
| leanmfg            |
| lukup_pub          |
| prod367db          |
| prodrptdb          |
| prodrptdb_archive  |
| qualitydb          |
| rail_test          |
| shift_smsmeer      |
| shiftcsd1          |
| shiftcsd1suprv     |
| shiftcsd2          |
| shiftcsd2suprv     |
+--------------------+
15 rows in set (0.00 sec)

mysql>



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]13-51PM 


albe@pmdsdata3:/srv/dkr/mysql519$ mysql   -u dg417 -pdg
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld8.sock' (13)



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]11-00AM 



 1075  07/06/20 10:34:37 sudo service mysql stop
 1076  07/06/20 10:36:56 sudo service mysql start
 1078  07/06/20 10:40:17 sudo nano debian.cnf
 1079  07/06/20 10:40:43 sudo service mysql stop
 1080  07/06/20 10:40:48 sudo service mysql start
 1082  07/06/20 10:42:50 mysql -uroot -p --socket=/var/run/mysqld/mysqld8.sock
 1083  07/06/20 10:44:03 mysql --protocol=TCP -u root -p
 1086  07/06/20 11:02:15 mysql  --port=3308 -u root -p
 1087  07/06/20 11:02:29 mysql  --host=localhost --port=3308 -u root -p
 1088  07/06/20 11:02:39 mysql  --host=127.0.0.1 --port=3308 -u root -p
 1089  07/06/20 11:03:58 /etc/mysql$ mysql  --host=10.4.1.224 --port=3308 -u dg417 -pdg
 1092  07/06/20 11:06:03 mysql  --host=127.0.0.1 --port=3308 -u dg417 -pdg
albe@pmdsdata3:~$



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  change many apps setting from localhost to 127.0.0.1
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]12-08PM 

sftp://albe@10.4.1.224/var/www/html/shiftcsd1sup/conf.ini

  ; host=localhost  
  ; David Gleba 2020-06-07_Sun_12.08-PM change to 127.0.0.1 from localhost. re. mysql519
  host=127.0.0.1  
  
sftp://albe@10.4.1.224/srv/web/prod367/config/database.yml

  # David Gleba 2020-06-07_Sun_12.08-PM change to 127.0.0.1 from localhost. re: mysql519
  # host: localhost
  host: 127.0.0.1
  

// sftp://10.4.1.224/var/www/html/prodrpt/actions/configdbphp.dbc
// David Gleba  2020-06-07 changed from localhost to 127.0.0.1 re: mysql519
//$dbhost = 'localhost';
$dbhost = '127.0.0.1';



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  phpmyadmin
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]12-09PM 

https://stackoverflow.com/questions/16801573/how-to-access-remote-server-with-local-phpmyadmin-client/22092539

 below lines to your /etc/phpmyadmin/config.inc.php file in the bottom:

	// David Gleba 2020-06-07 add server config. re. mysql519
	
	This doesn't work to login.. but may not need. it at least prevents using socket. must use port 3308. should be safe.
	$cfg['Servers'][$i]['host'] = '127.0.0.1:3308'; //provide hostname and port if other than default



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-07[Jun-Sun]21-28PM 


