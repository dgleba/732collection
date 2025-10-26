
create database if not exists metabasedb;

GRANT Usage,SELECT, show view ON metabasedb.* TO muser@'%' ;

GRANT all privileges ON metabasedb.* TO muser@'%' ;

