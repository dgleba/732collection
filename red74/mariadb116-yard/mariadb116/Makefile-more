
# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl



# during testing, remove all mysql data files...
nukemysql:
	docker-compose  run --rm dbm  bash -c 'chmod -R 777 /var/lib/mysql/; \
			chown -R 1000:33 /var/lib/mysql; '
			# may have to remove the files from the host. this said device busy.
			docker-compose  run --rm dbm  bash -c 'rm -rf  /var/lib/mysql/*;'
	


# seems I had trouble using $fold variable. I just used the explict folder name instead.
permd:  
	docker-compose exec dbm \
	bash -c "export fold=/crib; chmod -R ug+rws,o-rwx /crib; chown -R 1000:1000 /crib; \
		export fold=/in-out; chmod -R ug+rws,o-rwx /in-out; chown -R 1000:1000 /in-out "

pp:  
	docker-compose run --rm dbm sh -c 'chmod -R 777 /in-out ;  chmod -R 777 /crib'

prv: 
	docker-compose  exec dbm /bin/bash /script/privi519.sh

#
# dump all data
#
dump:
	docker-compose  exec dbm /bin/bash /script/all-individual-mysqldump.sh

dumpnoroot:
	docker-compose  exec dbm /bin/bash /script/all-individual-mysqldump.nonroot.sh



migr:
	cd /srv/dkr/mysql519; sudo ls; bash ./migrate-pd3.sh 2>&1 | tee -a /srv/dkr/mysql519/x/migratepd3_$$(date +"%Y-%m-%d_%H.%M.%S").log


# log stuff to look for slow queries etc...

glogc:  
	docker-compose exec dbm sh -c 'cd /in-out; cp /var/lib/mysql/mysql-519.log cp-general-log_$$(date +"%Y-%m-%d_%H.%M.%S").log; \
		chmod -R 777 *general-log*.log ; pwd; ls -l;'

glogon:
	docker-compose  -f docker-compose.yml exec dbm /bin/bash /script/glogon.sh

glogoff:
	docker-compose  -f docker-compose.yml exec dbm /bin/bash /script/glogoff.sh


#
# Use this in adminer..
# SET GLOBAL general_log = 0;
# SET GLOBAL general_log = 1;
#
use-glogoff-instead---glogrm:  
	docker-compose exec dbm sh -c 'cd /in-out; cp /var/lib/mysql/1eda0c1ab545.log general-log_$$(date +"%Y-%m-%d_%H.%M.%S").log; \
			rm /var/lib/mysql/1eda0c1ab545.log; chmod -R 777 general-log*.log ; pwd; ls -l;'



slogon:
	docker-compose  -f docker-compose.yml exec dbm /bin/bash /script/slogon.sh

slog:  
	docker-compose exec dbm sh -c 'cd /in-out; cp /var/lib/mysql/mysql-519-slow.log slow-log_$$(date +"%Y-%m-%d_%H.%M.%S").log; \
			xx--rm /var/lib/mysql/77c430a2c0d9-slow.log; chmod -R 777 *log*.log ; pwd; ls -la;'



x:  
	chmod +x *.sh
	
imp:
	docker-compose  exec dbm /bin/bash /script/imp-pd3.sh
  
mysh:
	docker-compose  -f docker-compose.yml exec dbm /bin/bash


cmp:
	docker-compose  exec dbm /bin/bash /script/comparedb519.sh
	bash ./comparedb.sh

cmp4:
	# compare mysql519 now (comp-c4) to previous (compr)
	docker-compose  exec dbm /bin/bash /script/comparedb519c4.sh
	bash ./comparedb-c4.sh

cmp2:
	# just compare pd3 to baseline 519. want to see very few changes.
	date
	cd /srv/dkr/mysql519 ; bash ./comparedb-pd3.sh
	date
	-rm ./sysdata/in-out/compr/*
	-rsync -av ./sysdata/in-out/compr-2020-06-07_Sun-imported1008am-baseline/ ./sysdata/in-out/compr
	bash ./comparedb.sh
	date

cmp5:
	# just compare pd3 to baseline pd3. want to see very few changes.
	bash ./cmp5.sh


# got error changing database user in metabase.. java.sql.SQLException: null, message from server: "Host 'pmdsdata8.stackpole.ca' is blocked because of many connection errors; unblock with 'mysqladmin flush-hosts'"
myflu:
	docker-compose  -f docker-compose.yml run --rm  dbm sh -c 'mysqladmin -u$$MYSQL_ROOT_USER -p$$MYSQL_ROOT_PASSWORD flush-hosts;'


mkd:
	 docker-compose exec dbm /bin/bash /script/mkdata.sh

mp:
	docker-compose  exec dbm sh -c 'mysql -uroot -p$$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON *.* TO ciuser@% IDENTIFIED BY $$mysqluserpass with Grant;"'

sh:
	docker-compose  run --rm dbm  bash


# careful with this one...
reinit:
	docker-compose  run --rm dbm  bash -c 'sudo mysql; bash mysql_install_db'
	







# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#  other and `less common` stuff...

