
#################################################################
#@  
#@  
#@  
####################################   2025-11-30[Nov-Sun]16-40PM 


------------

d1=/ap/dkr/732collection/red74/opencloud_817_yard/817__d/opencloud817d;
mkdir -p $d1;

cd $d1;

mkdir -p ./sysdata/opencloud-config
mkdir -p ./sysdata/opencloud-data



docker pull opencloudeu/opencloud-rolling:latest


------------



# https://docs.opencloud.eu/docs/admin/getting-started/container/docker#initialize-opencloud-first-time-setup

docker run --rm -it \
-v $d1/sysdata/opencloud-config:/etc/opencloud \
-v $d1/sysdata/opencloud-data:/var/lib/opencloud \
-e IDM_ADMIN_PASSWORD=admin \
opencloudeu/opencloud-rolling:latest init


--

output...


docker run --rm -it \
-v $d1/sysdata/opencloud-config:/etc/opencloud \
-v $d1/sysdata/opencloud-data:/var/lib/opencloud \
-e IDM_ADMIN_PASSWORD=admin \
opencloudeu/opencloud-rolling:latest init
Do you want to configure OpenCloud with certificate checking disabled?
 This is not recommended for public instances! [yes | no = default] yes

=========================================
 generated OpenCloud Config
=========================================
 configpath : /etc/opencloud/opencloud.yaml
 user       : admin
 password   : admin

[17:16:25] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__c/opencloud817c$ 


------------


use compose below.....


see $d1 above...
 
mkdir -p $d1;
cd $d1;

docker run  --rm   --name opencloud817c  \
-v $d1/sysdata/opencloud-config:/etc/opencloud \
-v $d1/sysdata/opencloud-data:/var/lib/opencloud \
  -e PROXY_HTTP_ADDR=0.0.0.0:9200 \
  -e OC_URL=https://10.33.44.81:9200 \
  -e OC_INSECURE=true     -p 9200:9200 opencloudeu/opencloud-rolling:latest



--



services:
  opencloud817c:
    image: opencloudeu/opencloud-rolling:latest
    #container_name: opencloud817c
    restart: always
    ports:
      - "9200:9200"
    environment:
      PROXY_HTTP_ADDR: "0.0.0.0:9200"
      OC_URL: "https://10.33.44.81:9200"
      OC_INSECURE: "true"
    volumes:
      - ./sysdata/opencloud-config:/etc/opencloud
      - ./sysdata/opencloud-data:/var/lib/opencloud




------------

