
#################################################################
#@  
#@  817a failed. just use whole git clone
#@  
####################################   2025-11-30[Nov-Sun]13-33PM 

/ap/dkr/732collection/red74/opencloud_817_yard/817__a


https://docs.opencloud.eu/docs/admin/getting-started/container/docker-compose/external-proxy


mkdir -p /ap/dkr/732collection/red74/opencloud_817_yard/opencloud817a
cd /ap/dkr/732collection/red74/opencloud_817_yard/


cd /ap/dkr/732collection/red74/opencloud_817_yard/
git clone https://github.com/opencloud-eu/opencloud-compose.git

cd opencloud-compose
cp .env.example .env
nano .env


-------------------------------------------------


consider:
https://docs.opencloud.eu/docs/admin/getting-started/container/docker-compose/external-proxy

i want to setup open cloud compose.
I want to later use cf tunnel to publish it. not now.
I would like to just access it in my home network with http:// ip : port.

what is simplest compose for open cloud to do this?




services:
  opencloud:2
    image: opencloud/opencloud:latest
    restart: unless-stopped
    ports:
      - "4080:8080"   # host:container port mapping
    environment:
      - OC_ADMIN_USER=admin
      - OC_ADMIN_PASSWORD=changeme
      - OC_BASE_URL=http://10.33.44.81:4080
    volumes:
      - ../sysdata/opencloud-data:/var/lib/opencloud

-------------------------------------------------


