
# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl

# run system with umask test dockerfile
# I can't seem to get writable group permissions 2018-08-27_Mon_21.28-PM
#

mm:
	docker-compose run --rm djdev python manage.py makemigrations mark616
	# docker-compose run --rm djdev python manage.py makemigrations blogapp
	docker-compose run --rm djdev python manage.py migrate

mig:
	docker-compose run --rm djdev python manage.py migrate



lite:
	bash -c "rmdir /code/db.sqlite3"; touch /code/db.sqlite3;


cronad:
	docker-compose    run --rm djdev   python manage.py crontab add

dir:
	docker-compose    run --rm djdev   ls -la; pwd;

delsysdata:
	docker-compose run -it --rm dbm  chmod -R 777 /var/lib/mysql ; 
	# docker-compose run --rm dbm sh -c 'pwd;  rm -rf /var/lib/mysql/*; '

  
perm:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..  
	# docker-compose run --rm djan sh -c 'su root;chmod -R g+w .;exit;exit'
	# docker-compose run --rm djdev sh -c 'chgrp -R www-data . &&  chmod -R ugo+w . && chmod +x *.sh && chmod -R 777 /data'
	# chmod -R 777 /code; chmod +x *.sh  ; 
	docker-compose run --rm djdev sh -c 'pwd; chgrp -R www-data . ; chmod -R ug+w,go-x /code;  '
	# docker-compose run --rm djdev sh -c 'pwd; chmod -R 777 /code/static ; '
	docker-compose run --rm djdev bash -c 'find . -type d -exec chmod 775 {} + '

# shell in django
#
sh:
	docker-compose run djdev /bin/bash


##  production !!

cs:
	  docker-compose -f docker-compose.prod.yml run --rm  djprod python manage.py collectstatic --noinput


prb:
	docker-compose  -f docker-compose.prod.yml  build

prup:
	docker-compose  -f docker-compose.prod.yml  up

prupd:
	docker-compose  -f docker-compose.prod.yml  up -d

prst:
	docker-compose  -f docker-compose.prod.yml  down

prrs:
	docker-compose  -f docker-compose.prod.yml  restart



umasktest:
	docker-compose  -f docker-compose.devtest.yml  run djangodev  django-admin.py startproject myproject .

  

# clean docker containers 
#
clean:   
	# remove this one.. 
	-docker rmi dkr382r-django_djangodev
  # remove docker containers exited 
	-docker rm $$(docker ps -qa --no-trunc --filter "status=exited") 
	# remove tagged <none> 
	-docker rmi $$(docker images | grep "^<none>" | awk '{ print $3 }') 
	-docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')


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
