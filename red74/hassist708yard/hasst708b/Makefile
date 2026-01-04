
# One liners and simple stuff may be here in this makefile. 



perm:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..  
	# docker-compose run --rm djan sh -c 'su root;chmod -R g+w .;exit;exit'
	# docker-compose run --rm djdev sh -c 'chgrp -R www-data . &&  chmod -R ugo+w . && chmod +x *.sh && chmod -R 777 /data'
	# chmod -R 777 /code; chmod +x *.sh  ; 
	docker-compose run --rm hasst sh -c ' pwd; chown -R 1000:1000 .  '
	docker-compose run --rm hasst bash -c 'find . -type d -exec chmod 775 {} + '




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/docker/compose/issues/2033 docker compose command line run sh multiple commands in one line
# $ requires escaping with $, so, $$
# continuation card  \
# - dash in front of command ignores error. -rm -f *.o

