
# turn off websitesimple. As a test, get an email from kuma 504dc.


#crontab:
#    28  4 * * * bash /ap/dkr/732collection/red74/back-up/kumacheck6212.sh
#    39 20 * * * bash /ap/dkr/732collection/red74/back-up/kumacheck6212.sh


set -vx

cd /ap/dkr/732collection/red74/websitesimple

/usr/bin/docker compose stop

sleep 230

/usr/bin/docker compose up -d 


