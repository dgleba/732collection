
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


# -------------------------------------------------
# red74_814_dkr

#/usr/bin/rclone sync /am/cruc4tb/ap/dkr/red74_814_dkr /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_814_dkr --copy-links --stats=30s --log-level INFO --log-file=/ap/log/rclone-bak_red74_814_dkr.log
# 14 3,12  * * * /usr/bin/rclone sync /am/cruc4tb/ap/dkr/red74_814_dkr /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_814_dkr --copy-links --stats=30s --log-level INFO --log-file=/ap/log/rclone-bak_red74_814_dkr.log
# /usr/bin/rclone sync /am/cruc4tb/ap/dkr/red74_814_dkr/ /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_814_dkr/ --copy-links --stats=30s --log-level INFO --log-file=/ap/log/rclone-bak_red74_814_dkr.log

/usr/bin/rclone sync /am/cruc4tb/ap/dkr/  /am/cruc4tb/koofry/volums/vd70-bakup/cruc4tb-ap-dkr/  --stats=30s --log-level INFO --log-file=/ap/log/rclone-bak_cruc-ap-dkr.log
 

# -------------------------------------------------
# /ap/dkr
# /usr/bin/rclone sync /ap/dkr /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_ap_dkr/ap-dkr --copy-links --stats=30s --log-level INFO --log-file=/ap/log/rclone-bak_red74_ap_dkr.log
# /usr/bin/rsync -aHAX --delete  --info=stats2,progress2  /ap/dkr/  /am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_ap_dkr/ap-dkr/   >> /ap/log/rclone-bak_red74_ap_dkr.log 2>&1

export srcp=/ap/dkr/;
export desp=/am/cruc4tb/koofry/volums/vd70-bakup/bak_red74_ap_dkr/ap-dkr/;
export logp=/ap/log;
export logf=rsynclog-ap-dkr-koofr.log;
mkdir -p $logp $desp; date;
rsync    --exclude "**/tmp/**" --exclude "**/x/**" \
  --exclude "**/log/**"  --exclude "**/logs/**"  \
    --delete -ah -HAX --itemize-changes  --stats   --log-file=$logp/$logf       $srcp $desp;

find $desp -type d -empty -delete;


# -------------------------------------------------
# wfsearch_811

# 58 4,12 * * * bash -c "cd /ap/dkr/732collection/red74/wfsearch_811_yard/wfsearch811/djangosite && /usr/bin/python3 wfsearch.py"
bash -c "cd /ap/dkr/732collection/red74/wfsearch_811_yard/wfsearch811/djangosite && /usr/bin/python3 wfsearch.py"

# -------------------------------------------------

