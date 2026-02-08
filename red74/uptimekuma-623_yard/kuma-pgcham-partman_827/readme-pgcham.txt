
#@################################################################
#@  
#@  Title:::  
#@  
#@###################################   2026-01-18[Jan-Sun]17-10PM 

# Reference:

https://pg-chameleon.readthedocs.io/en/ver2.0/usage.html#example

https://github.com/the4thdoctor/pg_chameleon/blob/main/pg_chameleon/configuration/config-example.yml


# usage:

I run this in docker compose on Ubuntu.

1. 
cp  example.env  .env


2.
Review the settings in each file.

The only thing I can think that may need changing is:
For example:
	The ip address in the .env file.


3.
On host, to allow write perms in the container.

chmod 777 -R mysql-init/
chmod 777 -R pg-init/
chmod 777 -R config/


4.

docker compose up


5.
Look at the tables in the databases:

Use a tool like dbeaver or adminer to view the tables in each db system.
Add/change a record in mysql and see the results in pg.
Deletes are set to be ignored.


------------

