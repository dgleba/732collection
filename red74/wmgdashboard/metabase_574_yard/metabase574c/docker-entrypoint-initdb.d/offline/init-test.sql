
create database if not exists adb;

GRANT Usage,SELECT, show view ON adb.* TO muser@'%' ;

GRANT all privileges ON adb.* TO muser@'%' ;

