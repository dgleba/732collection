
#################################################################
#@  
#@   backup key items on red74. some to 4tb and some to koofr
#@  
####################################   2025-11-29[Nov-Sat]08-46AM 

# bash /ap/dkr/732collection/red74/back-up/backupred74.817.sh
# 4 5 * * * bash /ap/dkr/732collection/red74/back-up/backupred74.817.sh
# * * * * * bash /ap/dkr/732collection/red74/back-up/backupred74.817.sh


#crontab
mkdir -p     /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_sys/lastbak
crontab -l > /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_sys/lastbak/crontab-red74.bak


#dkps
mkdir -p     /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_sys/lastbak
docker ps > /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_sys/lastbak/dockerps-red74.bak
docker ps -a > /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_sys/lastbak/dockerps-a_red74.bak


# /ap/dkr
/usr/bin/rclone sync /ap/dkr /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_ap_dkr/ap-dkr --copy-links --stats=30s --log-level INFO --log-file=/ap/log/rclone-bak_red74_ap_dkr.log



#
