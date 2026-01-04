

#@################################################################
#@  
#@  Title:::     
#@  
#@###################################   2026-01-02[Jan-Fri]19-59PM 


This was solved by using opencld.daveg.win in cloudflare.


=================================================

gpt question..



I am using 
git clone https://github.com/opencloud-eu/opencloud-compose.git

I set it up as below and I get errors below.

------------
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


http://127.0.0.1:9200/


Missing or invalid config
Please check if the file config.json exists and is correct.

Also, make sure to check the browser console for more information.

------------

opencloud817e-collabora-1          127.0.0.1:9980->9980/tcp                        Up 2 minutes (healthy)
opencloud817e-collaboration-1      9200/tcp, 127.0.0.1:9300->9300/tcp              Up 2 minutes
opencloud817e-opencloud-1          0.0.0.0:9200->9200/tcp, [::]:9200->9200/tcp     Up 2 minutes

------------

index.html-Dcix8mMB.mjs:37 Refused to connect to 'https://opencld.daveg.win/themes/opencloud/theme.json' because it violates the following Content Security Policy directive: "connect-src 'self' blob: https://raw.githubusercontent.com/opencloud-eu/awesome-apps/ https://update.opencloud.eu/ https://companion.opencloud.test/ wss://companion.opencloud.test/ https://keycloak.opencloud.test/".

index.html-Dcix8mMB.mjs:37 Fetch API cannot load https://opencld.daveg.win/themes/opencloud/theme.json. Refused to connect because it violates the document's Content Security Policy.
index.html-Dcix8mMB.mjs:37 Failed to load theme 'TypeError: Failed to fetch'
index.html-Dcix8mMB.mjs:37  OpenCloud Web UI 4.2.1-rc.1 
index.html-Dcix8mMB.mjs:37 Refused to connect to 'https://opencld.daveg.win/themes/opencloud/theme.json' because it violates the following Content Security Policy directive: "connect-src 'self' blob: https://raw.githubusercontent.com/opencloud-eu/awesome-apps/ https://update.opencloud.eu/ https://companion.opencloud.test/ wss://companion.opencloud.test/ https://keycloak.opencloud.test/".
index.html-Dcix8mMB.mjs:37 Fetch API cannot load https://opencld.daveg.win/themes/opencloud/theme.json. Refused to connect because it violates the document's Content Security Policy.
index.html-Dcix8mMB.mjs:37 Failed to load theme 'TypeError: Failed to fetch'
index.html-Dcix8mMB.mjs:37 TypeError: Cannot read properties of undefined (reading 'common')
    at Proxy.i (PortalTarget.vue_vue…cHSdI5.mjs:83:17841)
    at k (PortalTarget.vue_vue…cHSdI5.mjs:23:27921)
    at qd (index.html-Dcix8mMB.mjs:37:115418)
    at async Promise.all (:9200/index 3)
    at async Object.rO [as bootstrapApp] (index.html-Dcix8mMB.mjs:37:132937)
﻿
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
IDM_ADMIN_PASSWORD=admin
INITIAL_ADMIN_PASSWORD=
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

