
#################################################################
#@  
#@  
#@  
####################################   2025-11-30[Nov-Sun]16-40PM 

https://github.com/opencloud-eu

https://docs.opencloud.eu/docs/admin/getting-started/container/docker-compose/external-proxy


https://10.33.44.81:9200
https://10.33.44.81:9200


------------

worked:  2025-12-03_Wed_21.43-PM


git clone https://github.com/opencloud-eu/opencloud-compose.git


# must have absolute path for docker
d1=/ap/dkr/732collection/red74/opencloud_817_yard/817__g/
cd  $d1
dcfolder=opencloud_817g
source ${dcfolder}/.env


mkdir -p ./sysdata/opencloud/config
mkdir -p ./sysdata/opencloud/data

echo "${INITIAL_ADMIN_PASSWORD}"

docker run --rm -it \
-v $d1/sysdata/opencloud/config:/etc/opencloud \
-v $d1/sysdata/opencloud/data:/var/lib/opencloud \
-e IDM_ADMIN_PASSWORD="${INITIAL_ADMIN_PASSWORD}"  \
opencloudeu/opencloud-rolling:latest init


cd ${dcfolder}
dc up



------------


=================================================

[18:05:53] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__g$ docker run --rm -it \
-v $d1/sysdata/opencloud/config:/etc/opencloud \
-v $d1/sysdata/opencloud/data:/var/lib/opencloud \
-e IDM_ADMIN_PASSWORD="${INITIAL_ADMIN_PASSWORD}"  \
opencloudeu/opencloud-rolling:latest init
Do you want to configure OpenCloud with certificate checking disabled?
 This is not recommended for public instances! [yes | no = default] yes

=========================================
 generated OpenCloud Config
=========================================
 configpath : /etc/opencloud/opencloud.yaml
 user       : admin
 password   : w

[18:06:07] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__g$ dkps

=================================================




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~












S P A C E R  










S P A C E R  












~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~






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




d1=/ap/dkr/732collection/red74/opencloud_817_yard/817__e/opencloud817e;
mkdir -p $d1;

cd $d1;

mkdir -p ./sysdata/opencloud-config
mkdir -p ./sysdata/opencloud-data

mkdir -p ../sysdata/opencloud/config
mkdir -p ../sysdata/opencloud/data



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
-e IDM_ADMIN_PASSWORD=w -u root:root \
opencloudeu/opencloud-rolling:latest init
Do you want to configure OpenCloud with certificate checking disabled?
 This is not recommended for public instances! [yes | no = default] y
=========================================
 generated OpenCloud Config
=========================================
 configpath : /etc/opencloud/opencloud.yaml
 user       : admin
 password   : w
[21:24:28] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e/opencloud817e$ 


------------

