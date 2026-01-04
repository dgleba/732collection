
#################################################################
#@  
#@  
#@  
####################################   2025-11-30[Nov-Sun]16-40PM 

https://github.com/opencloud-eu

https://docs.opencloud.eu/docs/admin/getting-started/container/docker-compose/external-proxy

https://docs.opencloud.eu/docs/admin/getting-started/container/docker-compose/external-proxy#configure-and-start-opencloud


https://10.33.44.81:9200


------------

worked:  2025-12-03_Wed_21.43-PM

git clone https://github.com/opencloud-eu/opencloud-compose.git



d1=/ap/dkr/732collection/red74/opencloud_817_yard/817__e/;
#opencloud817e;
mkdir -p $d1;
cd $d1;

mkdir -p ./sysdata/opencloud-config
mkdir -p ./sysdata/opencloud-data

dcfolder=opencloud_817e
source ${dcfolder}/.env

echo "${INITIAL_ADMIN_PASSWORD}"

docker run --rm -it \
-v $d1/sysdata/opencloud/config:/etc/opencloud \
-v $d1/sysdata/opencloud/data:/var/lib/opencloud \
-e IDM_ADMIN_PASSWORD="${INITIAL_ADMIN_PASSWORD}"  \
opencloudeu/opencloud-rolling:latest init


cd ${dcfolder}
dc up



------------

------------

# .env

CHECK_FOR_UPDATES=false
COLLABORA_ADMIN_PASSWORD=.
COLLABORA_ADMIN_USER=admin
COLLABORA_DOMAIN=officeopencld.daveg.win
COLLABORA_HOME_MODE=true
COLLABORA_SSL_ENABLE=false
COLLABORA_SSL_VERIFICATION=false
COMPOSE_FILE=docker-compose.yml:weboffice/collabora.yml:external-proxy/opencloud.yml:external-proxy/collabora.yml
COMPOSE_PATH_SEPARATOR=:
IDM_ADMIN_PASSWORD=.
INITIAL_ADMIN_PASSWORD=.
INSECURE=true
LOG_LEVEL=DEBUG
LOG_PRETTY=true
OC_APPS_DIR=../sysdata/opencloud/apps
OC_CONFIG_DIR=../sysdata/opencloud/config
OC_CONTAINER_UID_GID="1000:1000"
OC_DATA_DIR=../sysdata/opencloud/data
OC_DOCKER_IMAGE=opencloudeu/opencloud-rolling
OC_DOMAIN=opencld.daveg.win
START_ADDITIONAL_SERVICES=""
WOPISERVER_DOMAIN=wopiopencld.daveg.win


------------



------------



#################################################################
#@  
#@  
#@  
####################################   2025-12-03[Dec-Wed]22-26PM 


I have opencloud working on https://10.33.44.81:9200/
based on this.
https://docs.opencloud.eu/docs/admin/getting-started/container/docker

how do i use webdav to access files?


upload
but noworky..
https://10.33.44.81:9200/remote.php/dav/spaces/683a1371-c4a8-425e-a945-1c8d1e00f49b$d64a6b19-c5ad-45d9-8b99-8925e1b5ea5d
https://10.33.44.81:9200/remote.php/webdav/spaces/683a1371-c4a8-425e-a945-1c8d1e00f49b$d64a6b19-c5ad-45d9-8b99-8925e1b5ea5d

but this works..

https://10.33.44.81:9200/remote.php/webdav/

https://10.33.44.81:9200/remote.php/webdav/spaces/upload



apptoken.

catchable disburse elite mortally tux flying


in winscp I get error..  /remote.php/dav/spaces 405 Method Not Allowed



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~












S P A C E R  










S P A C E R  












~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





#################################################################
#@  
#@  old.
#@  
####################################   2025-12-03[Dec-Wed]21-41PM 

git clone https://github.com/opencloud-eu/opencloud-compose.git



d1=/ap/dkr/732collection/red74/opencloud_817_yard/817__e/;
#opencloud817e;
mkdir -p $d1;

cd $d1;

mkdir -p ./sysdata/opencloud-config
mkdir -p ./sysdata/opencloud-data

# mkdir -p ../sysdata/opencloud/config
# mkdir -p ../sysdata/opencloud/data

dcfolder=opencloud_817e
source ${dcfolder}/.env

echo "${INITIAL_ADMIN_PASSWORD}"

docker run --rm -it \
-v $d1/sysdata/opencloud/config:/etc/opencloud \
-v $d1/sysdata/opencloud/data:/var/lib/opencloud \
-e IDM_ADMIN_PASSWORD="${INITIAL_ADMIN_PASSWORD}"  \
opencloudeu/opencloud-rolling:latest init


cd ${dcfolder}
dc up





~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~












S P A C E R  










S P A C E R  












~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




------------

# /sysdata/opencloud/config
d1=/ap/dkr/732collection/red74/opencloud_817_yard/817__e
docker run --rm -it \
-v $d1/sysdata/opencloud/config:/etc/opencloud \
-v $d1/sysdata/opencloud/data:/var/lib/opencloud \
-e IDM_ADMIN_PASSWORD=x -u root:root \
opencloudeu/opencloud-rolling:latest init


--
output...


[21:23:13] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e/opencloud817e$ d1=/ap/dkr/732collection/red74/opencloud_817_yard/817__e

docker run --rm -it \
-v $d1/sysdata/opencloud/config:/etc/opencloud \
-v $d1/sysdata/opencloud/data:/var/lib/opencloud \
-e IDM_ADMIN_PASSWORD=x -u root:root \
opencloudeu/opencloud-rolling:latest init
Do you want to configure OpenCloud with certificate checking disabled?
 This is not recommended for public instances! [yes | no = default] y
=========================================
 generated OpenCloud Config
=========================================
 configpath : /etc/opencloud/opencloud.yaml
 user       : admin
 password   : x
[21:24:28] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e/opencloud817e$ 


------------

