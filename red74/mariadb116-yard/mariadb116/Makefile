
# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl

# run system with umask test dockerfile
# I can't seem to get writable group permissions 2018-08-27_Mon_21.28-PM
#


imp:
	docker compose  exec dbm /bin/bash /script/imp-pd3.sh
  

impjsonsql: 
	docker-compose  exec dbm /bin/bash /script/imp-shaar.sh


#
# dump all data
#
dump:
	docker-compose  exec dbm bash /script/all-individual-mysqldump.sh


nukedb_careful:
	docker-compose    run --rm dbm bash -c "rm -rf /var/lib/mysql/*"

cleart:
	docker-compose    run --rm php bash -c "rm -rf /var/www/html/dgnote130b/templates_c/*"
	docker-compose    run --rm php bash -c "rm -rf /var/www/html/exampleapp/templates_c/*"


cronad:
	docker-compose    run --rm djdev   python manage.py crontab add


  
perm:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..  
	# docker-compose run --rm djan sh -c 'su root;chmod -R g+w .;exit;exit'
	docker-compose run --rm djdev sh -c 'chgrp -R www-data . &&  chmod -R g+w . && chmod +x *.sh && chmod -R 777 /data'


# shell in django
#
djbash:
	docker-compose run djangodev /bin/bash


prb:
	docker-compose  -f docker-compose.prod.yml  build

prup:
	docker-compose  -f docker-compose.prod.yml  up

prst:
	docker-compose  -f docker-compose.prod.yml  down


umasktest:
	docker-compose  -f docker-compose.devtest.yml  run djangodev  django-admin.py startproject myproject .

  
#
dkv: 
	docker --version
	docker-compose -version

perm1:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..  
	docker-compose run djangodev sh sc/fixpermsh

    
# having trouble setting env variable, but do I need it?  
#
perm2:  
	docker-compose run djangodev \
	bash -c "export fold=/myproject; chmod -R g+rws,o-w  $${fold}"

  
recreatep:  
# recreate for production...
	docker-compose -f docker-compose.prod.yml up --build  --force-recreate  

  
recreated:  
# dev recreate build force
	docker-compose  up --build  --force-recreate  
 
up:  
# dev recreate build force
	docker-compose  up 

  
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/docker/compose/issues/2033 docker compose command line run sh multiple commands in one line
# $ requires escaping with $, so, $$
# continuation card  \
# - dash in front of command ignores error. -rm -f *.o
