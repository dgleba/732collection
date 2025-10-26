
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  problem - "/code/entrypoint.sh": permission denied
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-12-28[Dec-Tue]00-14AM 




albe@host211220-1121:/ap/605dkrcollection/605-n_django_yard/dj605n$ make perm
# docker-compose run --rm djan sh -c 'su root;chmod -R g+w .;exit;exit'
docker-compose run --rm djdev sh -c 'chgrp -R www-data . &&  chmod -R g+w . && chmod +x *.sh && chmod -R 777 /data'
Removing dj605n_djdev_1
Creating dj605n_djdev_run ... done
Error response from daemon: OCI runtime create failed: container_linux.go:380: starting container process caused: exec: "/code/entrypoint.sh": permission denied: unknown
ERROR: 1
Makefile:15: recipe for target 'perm' failed
make: *** [perm] Error 1
albe@host211220-1121:/ap/605dkrcollection/605-n_django_yard/dj605n$


---

ans.

chmod +x entrypoint.sh


    chmod uo+x **/*.sh

    or

    find ./ -name "*.sh" -exec chmod +x {} \;



=================================================


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  folder db.sqlite3
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-12-29[Dec-Wed]16-40PM 


If db.sqlite3 does not exist when starting with `dc up`, it will create a folder called db.sqlite3.

Run migrations first or touch db.sqlite3.

=================================================

