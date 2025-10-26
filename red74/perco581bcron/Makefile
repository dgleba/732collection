
# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl


pperm:
	docker-compose run --rm  perco 	bash -c "chmod -R 777  /alog"


syncbar:
	docker-compose   run --rm  perco bash -c "bash /code/pt_sync_barcode1.sh"

grant:
	docker-compose   run --rm  perco bash -c "bash /code/pt_grants_prdb.sh"

synca:
	docker-compose   run --rm  perco bash -c "bash /code/pt_sync_prodrptdb_vw_asset.sh"

syncgf:
	docker-compose   run --rm  perco bash -c "bash /code/pt_sync_gfxprod.sh"

ark:
	docker-compose   run --rm  perco bash -c "bash /code/archivegfxproduction.sh"

arc0:
	docker-compose   run --rm  perco bash -c "bash /code/start02gfxproduction.sh"


test12:
	docker-compose   run --rm  perco bash -c "bash /code/pta_test12.sh"

synp:
	docker-compose   run --rm  perco bash -c "bash /code/pt_sync_prodrptdb.sh"

synp2:
	docker-compose   run --rm  perco bash -c "bash /code/pt_sync_proddb2.sh"

syncn:
	docker-compose   run --rm  perco bash -c "bash /code/pt_sync_dgnote130.sh"

syncnb:
	docker-compose   run --rm  perco bash -c "bash /code/pt_sync_dgnote130b.sh"

syncnc:
	docker-compose   run --rm  perco bash -c "bash /code/pt_sync_dgnote130c-lrg.sh"


ps:
	docker-compose   exec  perco bash -c "ps -ef"






# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







#  other / examples stuff...






# build and start up
# Only lines after the last line edited in Dockerfile will be built.
# Lines unchanged before the last line edited in the Dockerfile will be taken from cache.
#
up-99:
	docker-compose build
	chmod +x ./perco/*.sh
	docker-compose up -d
	docker-compose logs -tf






dd-9-99:
	# remove everything for this project. images and all.
	docker-compose down --remove-orphans --rmi all



m8-9-99:
	docker-compose exec  deb /bin/bash -c ' 	echo "Test mail debian-mail08 dkr" | mail  -r davidgleba@hotmail.com -s "Test mail 478"  dgleba@gmail.com '

m7-99:
	docker-compose exec  deb /bin/bash -c ' 	echo -e  "Test mail  dkr \n isup \n = \n " | mail  -r david1212@gmail.com -s "Test mail 4915"  dgleba@gmail.com '

m6-99:
	docker-compose exec  deb /bin/bash -c ' 	echo "Test mail debian-mail08 dkr" | mail  -r dgleba@stackpole.com -s "Test mail 478"  dgleba@stackpole.com '

p-99:
	chmod +x *.sh


# this wont work, but it works to send mail within make sh...
m7a-99:
	docker-compose exec   deb /bin/bash -c ' sleep 1 && echo "Subject: test 614" | /usr/sbin/sendmail dgleba@stackpole.com '

m9-99:
	docker-compose exec   deb /bin/bash -c ' sleep 1 && echo "Subject: test 616" | /usr/sbin/sendmail dgleba@gmail.com '

m5-99:
	docker-compose run   deb /bin/bash -c ' sleep 3 && echo "Subject: test 612" | /usr/sbin/sendmail dgleba@stackpole.com '

m4-99:
	docker-compose run --rm  deb /bin/bash -c ' 	echo "Test mail debian-mail08 dkr" | mail  -r dgleba@stackpole.com -s "Test mail 470"  dgleba@stackpole.com  '

m3-99:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run --rm  deb /bin/bash -c ' 	echo "Test mail debian-smpl dkr" | mail  -r dgleba@stackpole.com -s "Test mail 450"  dgleba@stackpole.com  '

m2-99:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run --rm  deb /bin/bash -c ' ls -la && pwd \
		&& debconf-show postfix && echo "Test mail debian-smpl dkr" | mail  -r dgleba@stackpole.com -s "Test mail 449"  dgleba@stackpole.com  '

sm-99:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run --rm  deb /bin/bash -c ' ls -la && pwd \
		&& debconf-show postfix && echo "Subject: test 447 debian-smpl dkr" | /usr/sbin/sendmail dgleba@stackpole.com  '

dco-99:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run  deb /bin/bash -c ' ls && pwd \
		&& debconf-show postfix  '


upsf-99:
	docker-compose  -f docker-compose-sf.yml up --build  --force-recreate

shprox-99:
	docker-compose  -f docker-compose.yml exec proxy /bin/bash

 mydump-99:
	docker-compose  -f mysql/docker-compose.yml exec dbm /bin/bash /root/all-individual-mysqldump.sh

mycrd-99:
	docker-compose exec dbm /bin/bash /root/dbcr.sh

myimpa-99:
	docker-compose  -f mysql/docker-compose.yml exec dbm /bin/bash /root/sh21.sh


mydumpb-99:
	docker-compose  -f mysql/docker-compose.yml exec dbm sh -c 'exec mysqldump  --force --opt --user=root -p"$$MYSQL_ROOT_PASSWORD" --databases dkrdbm dgnote130  \
    --complete-insert --quote-names  --allow-keywords  \
    --skip-add-drop-table --add-drop-database  --skip-lock-tables  --no-tablespaces --no-create-info --routines  \
    --events  > /home/db_mysqldump.sql '


mycrd9-99:
	docker-compose exec dbm sh -c 'exec mysql  -uroot -p"$$MYSQL_ROOT_PASSWORD"  -e "create database \
			if not exists metabasedb"'


myrup9:
# db recreate build force
	docker-compose  up --build  --force-recreate

myup9:
# db up
	docker-compose up

phprup9:
	# docker-compose  -f php/docker-compose.yml stop \
	docker-compose  -f ../php392/docker-compose.yml up --build  --force-recreate

phpup9:
	docker-compose  -f ../php392/docker-compose.yml up


myl-99:
	docker-compose  -f mysql/docker-compose.yml logs -t -f

adup99:
	docker-compose  -f ../adminer392/docker-compose.yml up --build  --force-recreate

myd99:
# dump
	docker-compose  -f mysql/docker-compose.yml run



# run system with umask test dockerfile
# I can't seem to get writable group permissions 2018-08-27_Mon_21.28-PM
#
umasktest-99:
	docker-compose  -f docker-compose.devtest.yml  run djangodev  django-admin.py startproject myproject .


# shell in django
#
djbash-99:
	docker-compose run djangodev /bin/bash

dps99:
	docker images
	docker network ls
	docker volume ls
	docker ps -a
	docker ps


# clean docker containers
#
clean-99:
	# remove this one..
	-docker rmi dkr382django2t_djangodev
	-docker rmi dkr382r-django_djangodev
  # remove docker containers exited
	-docker rm $$(docker ps -qa --no-trunc --filter "status=exited")
	# remove tagged <none>
	-docker rmi $$(docker images | grep "^<none>" | awk '{ print $3 }')
  #volumes
	#careful.. -docker volume rm $$(docker volume ls -qf dangling=true)
	docker images
	docker network ls
	docker volume ls
	docker ps -a
	docker ps


#
dkv-99:
	docker --version
	docker-compose -version


perm-9-99:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..
	docker-compose run djangodev sh sc/fixpermsh


# having trouble setting env variable, but do I need it?
#
perm29:
	docker-compose run djangodev \
	bash -c "export fold=/myproject; chmod -R g+rws,o-w  $${fold}"


recreatep-99:
# recreate for production...
	docker-compose -f docker-compose.prod.yml up --build  --force-recreate

rup1-99:
# dev recreate build force
	docker-compose  up --build  --force-recreate

up1-99:
# dev recreate build force
	docker-compose  up



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/docker/compose/issues/2033 docker compose command line run sh multiple commands in one line
# $ requires escaping with $, so, $$
# continuation card  \
# - dash in front of command ignores error. -rm -f *.o
