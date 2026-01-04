
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

dcfolder=opencloud817e
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
COLLABORA_ADMIN_USER=.
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




#################################################################
#@  
#@   Webdav
#@   
####################################   2025-12-03[Dec-Wed]22-26PM 


webdav works:

must create and use app token - see user icon, pref, app token

This path must be used in winscp...

curl  -u admin https://opencld.daveg.win
/remote.php/dav/files/admin/

This is the address to the adma space in user admin.

curl  -u admin https://opencld.daveg.win
/remote.php/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53/
/remote.php/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53


This doesn't output anything, but it works in winscp.
	curl -u "admin:APP_PASSWORD" \
		https://opencld.daveg.win/remote.php/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53/


------------

get info....

[16:21:19] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e/opencloud817e$ 

curl -u "admin:app-token"   https://opencld.daveg.win/graph/v1.0/me/drives
{"value":[{"driveAlias":"virtual/shares","driveType":"virtual","id":"a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668","lastModifiedDateTime":"2026-01-04T17:46:17.660638721Z","name":"Shares","root":{"eTag":"\"ced4fc7e543f4f5740996ba3ed243157\"","id":"a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668","webDavUrl":"https://opencld.daveg.win/dav/spaces/a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668"},"webUrl":"https://opencld.daveg.win/f/a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668"},{"driveAlias":"personal/admin","driveType":"personal","id":"0f385aa5-2d34-4cff-a9c9-899071b886b6$280aaea5-cfc1-4c68-84a9-a12f92aab026","lastModifiedDateTime":"2026-01-04T20:57:08.033302052Z","name":"Admin","owner":{"user":{"displayName":"","id":"8c1aec75-031a-48d6-a814-dc9c40fc114c"}},"quota":{"remaining":9223372036854775807,"state":"normal","total":0,"used":16835},"root":{"eTag":"\"8f5caba501d928c325f663074739e863\"","id":"0f385aa5-2d34-4cff-a9c9-899071b886b6$280aaea5-cfc1-4c68-84a9-a12f92aab026","webDavUrl":"https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$280aaea5-cfc1-4c68-84a9-a12f92aab026"},"webUrl":"https://opencld.daveg.win/f/0f385aa5-2d34-4cff-a9c9-899071b886b6$280aaea5-cfc1-4c68-84a9-a12f92aab026"},{"driveAlias":"mountpoint/new-file.ods","driveType":"mountpoint","id":"a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668!0f385aa5-2d34-4cff-a9c9-899071b886b6:b40377aa-2cd6-4270-b6d1-12e0925d5837:a5e637cb-f539-407e-8d9a-409b07f310f1","name":"New file.ods","owner":{"user":{"displayName":"","id":"b8357e97-be40-4bcb-b01a-77eef88cbbdb"}},"root":{"id":"a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668!0f385aa5-2d34-4cff-a9c9-899071b886b6:b40377aa-2cd6-4270-b6d1-12e0925d5837:a5e637cb-f539-407e-8d9a-409b07f310f1","remoteItem":{"driveAlias":"personal/dgleba","eTag":"\"ced4fc7e543f4f5740996ba3ed243157\"","file":{"mimeType":"application/vnd.oasis.opendocument.spreadsheet"},"id":"0f385aa5-2d34-4cff-a9c9-899071b886b6$b40377aa-2cd6-4270-b6d1-12e0925d5837!df134179-e3a0-4e93-9fd3-0c42fb345501","lastModifiedDateTime":"2026-01-04T17:46:17.660638721Z","name":"New file.ods","path":"/New file.ods","rootId":"0f385aa5-2d34-4cff-a9c9-899071b886b6$b40377aa-2cd6-4270-b6d1-12e0925d5837!b40377aa-2cd6-4270-b6d1-12e0925d5837","size":10716,"webDavUrl":"https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$b40377aa-2cd6-4270-b6d1-12e0925d5837%21b40377aa-2cd6-4270-b6d1-12e0925d5837/New%20file.ods"},"webDavUrl":"https://opencld.daveg.win/dav/spaces/a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668%210f385aa5-2d34-4cff-a9c9-899071b886b6:b40377aa-2cd6-4270-b6d1-12e0925d5837:a5e637cb-f539-407e-8d9a-409b07f310f1"},"webUrl":"https://opencld.daveg.win/f/a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668%210f385aa5-2d34-4cff-a9c9-899071b886b6:b40377aa-2cd6-4270-b6d1-12e0925d5837:a5e637cb-f539-407e-8d9a-409b07f310f1"},{"driveAlias":"project/adma","driveType":"project","id":"0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53","lastModifiedDateTime":"2026-01-04T20:29:16.333716036Z","name":"adma","owner":{"user":{"displayName":"","id":"999ba3fc-be46-448a-89c4-b6e21e616b53"}},"quota":{"remaining":999979594,"state":"normal","total":1000000000,"used":20406},"root":{"eTag":"\"bd9748915452d9a142120bb7ab395670\"","id":"0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53","webDavUrl":"https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53"},"special":[{"eTag":"\"becb8a97b271b0a97b6403659e63c112\"","file":{"mimeType":"image/png"},"id":"0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53!305d4e65-3e05-425c-8f2c-fc4dccb58682","image":{"height":1080,"width":1920},"lastModifiedDateTime":"2026-01-04T20:29:01.434852933Z","name":"image.png","parentReference":{"driveId":"0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53","driveType":"project","id":"0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53!fb303749-1548-4f4d-ad0c-05937f6c3257","name":".space","path":"/.space"},"size":10921,"specialFolder":{"name":"image"},"webDavUrl":"https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53%21999ba3fc-be46-448a-89c4-b6e21e616b53/.space/image.png"},{"eTag":"\"d2031c8597a698aa607ea0c89892a769\"","file":{"mimeType":"text/markdown"},"id":"0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53!d7cf4b7e-cedc-4b67-99ee-a90e8cf1ec14","lastModifiedDateTime":"2026-01-04T20:29:01.446215432Z","name":"readme.md","parentReference":{"driveId":"0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53","driveType":"project","id":"0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53!fb303749-1548-4f4d-ad0c-05937f6c3257","name":".space","path":"/.space"},"size":46,"specialFolder":{"name":"readme"},"webDavUrl":"https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53%21999ba3fc-be46-448a-89c4-b6e21e616b53/.space/readme.md"}],"webUrl":"https://opencld.daveg.win/f/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53"}]}


{
  "value": [
    {
      "driveAlias": "virtual/shares",
      "driveType": "virtual",
      "id": "a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668",
      "lastModifiedDateTime": "2026-01-04T17:46:17.660638721Z",
      "name": "Shares",
      "root": {
        "eTag": "\"ced4fc7e543f4f5740996ba3ed243157\"",
        "id": "a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668",
        "webDavUrl": "https://opencld.daveg.win/dav/spaces/a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668"
      },
      "webUrl": "https://opencld.daveg.win/f/a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668"
    },
    {
      "driveAlias": "personal/admin",
      "driveType": "personal",
      "id": "0f385aa5-2d34-4cff-a9c9-899071b886b6$280aaea5-cfc1-4c68-84a9-a12f92aab026",
      "lastModifiedDateTime": "2026-01-04T20:57:08.033302052Z",
      "name": "Admin",
      "owner": {
        "user": {
          "displayName": "",
          "id": "8c1aec75-031a-48d6-a814-dc9c40fc114c"
        }
      },
      "quota": {
        "remaining": 9223372036854776000,
        "state": "normal",
        "total": 0,
        "used": 16835
      },
      "root": {
        "eTag": "\"8f5caba501d928c325f663074739e863\"",
        "id": "0f385aa5-2d34-4cff-a9c9-899071b886b6$280aaea5-cfc1-4c68-84a9-a12f92aab026",
        "webDavUrl": "https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$280aaea5-cfc1-4c68-84a9-a12f92aab026"
      },
      "webUrl": "https://opencld.daveg.win/f/0f385aa5-2d34-4cff-a9c9-899071b886b6$280aaea5-cfc1-4c68-84a9-a12f92aab026"
    },
    {
      "driveAlias": "mountpoint/new-file.ods",
      "driveType": "mountpoint",
      "id": "a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668!0f385aa5-2d34-4cff-a9c9-899071b886b6:b40377aa-2cd6-4270-b6d1-12e0925d5837:a5e637cb-f539-407e-8d9a-409b07f310f1",
      "name": "New file.ods",
      "owner": {
        "user": {
          "displayName": "",
          "id": "b8357e97-be40-4bcb-b01a-77eef88cbbdb"
        }
      },
      "root": {
        "id": "a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668!0f385aa5-2d34-4cff-a9c9-899071b886b6:b40377aa-2cd6-4270-b6d1-12e0925d5837:a5e637cb-f539-407e-8d9a-409b07f310f1",
        "remoteItem": {
          "driveAlias": "personal/dgleba",
          "eTag": "\"ced4fc7e543f4f5740996ba3ed243157\"",
          "file": {
            "mimeType": "application/vnd.oasis.opendocument.spreadsheet"
          },
          "id": "0f385aa5-2d34-4cff-a9c9-899071b886b6$b40377aa-2cd6-4270-b6d1-12e0925d5837!df134179-e3a0-4e93-9fd3-0c42fb345501",
          "lastModifiedDateTime": "2026-01-04T17:46:17.660638721Z",
          "name": "New file.ods",
          "path": "/New file.ods",
          "rootId": "0f385aa5-2d34-4cff-a9c9-899071b886b6$b40377aa-2cd6-4270-b6d1-12e0925d5837!b40377aa-2cd6-4270-b6d1-12e0925d5837",
          "size": 10716,
          "webDavUrl": "https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$b40377aa-2cd6-4270-b6d1-12e0925d5837%21b40377aa-2cd6-4270-b6d1-12e0925d5837/New%20file.ods"
        },
        "webDavUrl": "https://opencld.daveg.win/dav/spaces/a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668%210f385aa5-2d34-4cff-a9c9-899071b886b6:b40377aa-2cd6-4270-b6d1-12e0925d5837:a5e637cb-f539-407e-8d9a-409b07f310f1"
      },
      "webUrl": "https://opencld.daveg.win/f/a0ca6a90-a365-4782-871e-d44447bbc668$a0ca6a90-a365-4782-871e-d44447bbc668%210f385aa5-2d34-4cff-a9c9-899071b886b6:b40377aa-2cd6-4270-b6d1-12e0925d5837:a5e637cb-f539-407e-8d9a-409b07f310f1"
    },
    {
      "driveAlias": "project/adma",
      "driveType": "project",
      "id": "0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53",
      "lastModifiedDateTime": "2026-01-04T20:29:16.333716036Z",
      "name": "adma",
      "owner": {
        "user": {
          "displayName": "",
          "id": "999ba3fc-be46-448a-89c4-b6e21e616b53"
        }
      },
      "quota": {
        "remaining": 999979594,
        "state": "normal",
        "total": 1000000000,
        "used": 20406
      },
      "root": {
        "eTag": "\"bd9748915452d9a142120bb7ab395670\"",
        "id": "0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53",
        "webDavUrl": "https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53"
      },
      "special": [
        {
          "eTag": "\"becb8a97b271b0a97b6403659e63c112\"",
          "file": {
            "mimeType": "image/png"
          },
          "id": "0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53!305d4e65-3e05-425c-8f2c-fc4dccb58682",
          "image": {
            "height": 1080,
            "width": 1920
          },
          "lastModifiedDateTime": "2026-01-04T20:29:01.434852933Z",
          "name": "image.png",
          "parentReference": {
            "driveId": "0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53",
            "driveType": "project",
            "id": "0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53!fb303749-1548-4f4d-ad0c-05937f6c3257",
            "name": ".space",
            "path": "/.space"
          },
          "size": 10921,
          "specialFolder": {
            "name": "image"
          },
          "webDavUrl": "https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53%21999ba3fc-be46-448a-89c4-b6e21e616b53/.space/image.png"
        },
        {
          "eTag": "\"d2031c8597a698aa607ea0c89892a769\"",
          "file": {
            "mimeType": "text/markdown"
          },
          "id": "0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53!d7cf4b7e-cedc-4b67-99ee-a90e8cf1ec14",
          "lastModifiedDateTime": "2026-01-04T20:29:01.446215432Z",
          "name": "readme.md",
          "parentReference": {
            "driveId": "0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53",
            "driveType": "project",
            "id": "0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53!fb303749-1548-4f4d-ad0c-05937f6c3257",
            "name": ".space",
            "path": "/.space"
          },
          "size": 46,
          "specialFolder": {
            "name": "readme"
          },
          "webDavUrl": "https://opencld.daveg.win/dav/spaces/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53%21999ba3fc-be46-448a-89c4-b6e21e616b53/.space/readme.md"
        }
      ],
      "webUrl": "https://opencld.daveg.win/f/0f385aa5-2d34-4cff-a9c9-899071b886b6$999ba3fc-be46-448a-89c4-b6e21e616b53"
    }
  ]
}

[16:21:37] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e/opencloud817e$ 


------------



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


Must use app token.

apptoken.



in winscp I get error..  /remote.php/dav/spaces 405 Method Not Allowed


------------


2026-01-04_Sun_14.54-PM

I have this setup.
https://docs.opencloud.eu/docs/admin/getting-started/container/docker-compose/external-proxy
I see this page.
https://docs.opencloud.eu/docs/next/dev/server/services/webdav/environment-variables

HOw do I test webdav access?


curl -u admin:PASS -X PROPFIND \
  -H "Depth: 1" \
  https://cloud.example.com/remote.php/dav/files/USER/


------------


https://opencld.daveg.win/remote.php/dav/files/admin/


/remote.php/dav/files/admin

[15:52:26] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e/opencloud817e$ curl -v -u admin https://opencld.daveg.win/remote.php/dav/files/admin/
Enter host password for user 'admin':
* Host opencld.daveg.win:443 was resolved.
* IPv6: 2606:4700:130:436c:6f75:6466:6c61:7265
* IPv4: 172.64.80.1
...


------------


2026-01-04_Sun_16.04-PM

d1=/ap/dkr/732collection/red74/opencloud_817_yard/817__e/;
cd $d1;
dcfolder=opencloud817e
source ${dcfolder}/.env
echo "${dgpass2}"

curl -u admin:"${dgpass2}" -X PROPFIND  -H "Depth: 1" \
  https://opencld.daveg.win/remote.php/dav/files/admin/


[15:05:25] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e$ curl -u admin:"${dgpass2}" -X PROPFIND  -H "Depth: 1" \
  https://opencld.daveg.win/remote.php/dav/files/dgleba/
<?xml version="1.0" encoding="UTF-8"?>
<d:error xmlns:d="DAV" xmlns:s="http://sabredav.org/ns"><s:Exception>Sabre\DAV\Exception\PermissionDenied</s:Exception>
<s:Message>Authentication error</s:Message></d:error>

[15:06:08] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e$ curl -u admin:"${dgpass2}" -X PROPFIND  -H "Depth: 1" \
  https://opencld.daveg.win/remote.php/dav/files/admin/
<?xml version="1.0" encoding="UTF-8"?>
<d:error xmlns:d="DAV" xmlns:s="http://sabredav.org/ns"><s:Exception>Sabre\DAV\Exception\PermissionDenied</s:Exception>
<s:Message>Authentication error</s:Message></d:error>
[15:09:20] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e$ 

--

locally:


docker exec -it <app-container> curl -u admin:"${dgpass2}"   -X PROPFIND -H "Depth: 1" \
  http://localhost:8080/remote.php/dav/files/admin/

cd ${dcfolder}
dc exec opencloud curl -u admin:"${dgpass2}" -X PROPFIND -H "Depth: 1"  http://127.0.0.1:9200/remote.php/dav/files/admin/




#################################################################


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



#@################################################################
#@  
#@  Title:::     old
#@  
#@###################################   2026-01-04[Jan-Sun]16-11PM 


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



#@################################################################
#@  
#@  Title:::    
#@  
#@###################################   2026-01-04[Jan-Sun]16-12PM 




#################################################################

[11:19:24] albe@del-7410:/ap/dkr/732collection/red74/opencloud_817_yard/817__e/opencloud817e$ dkd
WARN[0000] The "SMTP_USERNAME" variable is not set. Defaulting to a blank string. 
WARN[0000] The "SMTP_PASSWORD" variable is not set. Defaulting to a blank string. 
WARN[0000] The "SMTP_AUTHENTICATION" variable is not set. Defaulting to a blank string. 
WARN[0000] The "SMTP_HOST" variable is not set. Defaulting to a blank string. 
WARN[0000] The "SMTP_PORT" variable is not set. Defaulting to a blank string. 


#################################################################



docker-compose.yml:56:      OC_PASSWORD_POLICY_BANNED_PASSWORDS_LIST: banned-password-list.txt
docker-compose.yml:57:      # control the password enforcement and policy for public shares
docker-compose.yml:60:      OC_PASSWORD_POLICY_DISABLED: "${OC_PASSWORD_POLICY_DISABLED:-false}"
docker-compose.yml:61:      OC_PASSWORD_POLICY_MIN_CHARACTERS: "${OC_PASSWORD_POLICY_MIN_CHARACTERS:-8}"
docker-compose.yml:62:      OC_PASSWORD_POLICY_MIN_LOWERCASE_CHARACTERS: "${OC_PASSWORD_POLICY_MIN_LOWERCASE_CHARACTERS:-1}"
docker-compose.yml:63:      OC_PASSWORD_POLICY_MIN_UPPERCASE_CHARACTERS: "${OC_PASSWORD_POLICY_MIN_UPPERCASE_CHARACTERS:-1}"
docker-compose.yml:64:      OC_PASSWORD_POLICY_MIN_DIGITS: "${OC_PASSWORD_POLICY_MIN_DIGITS:-1}"
docker-compose.yml:65:      OC_PASSWORD_POLICY_MIN_SPECIAL_CHARACTERS: "${OC_PASSWORD_POLICY_MIN_SPECIAL_CHARACTERS:-1}"




# no..
SHARE_PASSWORD_MIN_LENGTH=1
SHARE_PASSWORD_REQUIRE_UPPER=false
SHARE_PASSWORD_REQUIRE_LOWER=false
SHARE_PASSWORD_REQUIRE_DIGIT=false
SHARE_PASSWORD_REQUIRE_SPECIAL=false
SHARE_PASSWORD_FORCE=false
# no..
OC_SHARE_FORCE_PASSWORD=false
OC_SHARE_PASSWORD_POLICY_MIN_LENGTH=4
OC_SHARE_PASSWORD_POLICY_REQUIRE_UPPER=false
OC_SHARE_PASSWORD_POLICY_REQUIRE_LOWER=false
OC_SHARE_PASSWORD_POLICY_REQUIRE_DIGIT=false
OC_SHARE_PASSWORD_POLICY_REQUIRE_SPECIAL=false
# no.. 
OC_PASSWORD_POLICY_ENABLED=true
OC_PASSWORD_POLICY_MIN_LENGTH=1
OC_PASSWORD_POLICY_REQUIRE_UPPER=false
OC_PASSWORD_POLICY_REQUIRE_LOWER=false
OC_PASSWORD_POLICY_REQUIRE_DIGIT=false
OC_PASSWORD_POLICY_REQUIRE_SPECIAL=false


#################################################################



=================================================

copy and compare..


diff -r 817__e 817__e01

/ap/dkr/732collection/red74

sudo rsync -a opencloud_817_yard baks

sudo chown albe:albe baks


------------

sudo cp -a /ap/dkr/732collection/red74/opencloud_817_yard/817__e00/sysdata/ /ap/dkr/732collection/red74/opencloud_817_yard/817__e/sysdata/

diff -r /ap/dkr/732collection/red74/opencloud_817_yard/817__e00/sysdata/ /ap/dkr/732collection/red74/opencloud_817_yard/817__e/sysdata/

------------

sudo cp -a /ap/dkr/732collection/red74/opencloud_817_yard/worksok/817__e00/opencloud817e/config /ap/dkr/732collection/red74/opencloud_817_yard/817__e/opencloud817e/config




#################################################################


