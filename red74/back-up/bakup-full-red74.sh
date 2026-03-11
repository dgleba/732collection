
# backup red74 full computer rsync rclone [b 2026-01-23]

### this  https://hedge.daveg.win/s/ewYo2vmlq

#crontab:
##  20 2 * * * bash /ap/dkr/732collection/red74/back-up/bakup-full-red74.sh


#@################################################################
#@  
#@  Title:::   bu  / to cruc - then - cruc to 4tbc
#@  
#@###################################   2026-01-23[Jan-Fri]21-17PM 


export srcp=/
export desp=/am/cruc4tb/bakup/red74-rut/
export logp=/ap/log
export logf=rsynclog-red74-rut.log
mkdir -p $logp $desp;
date;
sudo rsync -ah  --prune-empty-dirs  \
  --exclude "/dev/**" \
  --exclude "/proc/**"   --exclude "/sys/**"   --exclude "/run/**" \
  --exclude "/tmp/**" --exclude "/lost+found/**" \
  --exclude "/mnt/**" --exclude "/am/**"   --exclude "/media/**" \
  --exclude "/snap/**" \
  --exclude "**/var/run/**" --exclude "**/var/log/**" \
    --itemize-changes  --stats --safe-links   --log-file=$logp/$logf         $srcp $desp;
	
sudo find $desp -type d -empty -delete;


###### ------------------


if [[ -f /media/albe/4tbc/z_marker_disk_4tbc.txt ]]; then
    
	#testing... find /media/albe/4tbc/ | grep hello

	export srcp=/am/cruc4tb/
	export desp=/media/albe/4tbc/bakup/cruc4tb/
	export logp=/ap/log
	export logf=rsync-4tb24tbc-4tbb.log 
	mkdir -p $logp $desp
	sudo find $desp -type d -empty -delete
	date;
	export;
	sudo rsync -ah  --prune-empty-dirs   --exclude='/.Trash-1000/'   --exclude='/.Trash-1000/**' \
	  --exclude='/x/'   --exclude='/x/**'  --exclude='**/x/**' \
	  --exclude='/tmp/**' \
	  --exclude='/mnt/**'   --exclude='/media/**' \
	  --exclude='/00/**' \
	  --exclude='/bag-optional/**' \
	  --exclude='/copyof/**' \
	  --exclude='/iso/**' \
	  --exclude='/lost+found/**'   --exclude='/snapm**' \
	  --exclude='**/var/run/**' --exclude='**/var/log/**' \
	  --exclude='/koofry/**' \
	  --itemize-changes  --safe-links  --stats  --log-file=$logp/$logf         $srcp $desp;

	date;
	sudo chmod 777 /ap/log/*;
	sudo find $desp -type d -empty -delete;
	

else
    echo "$(date '+%Y-%m-%d %H:%M:%S') Marker file missing: /media/albe/4tbc/z_marker_disk_4tbc.txt" > "$logp/4tbc-disk-missing.log"
fi

	#2026-03-07_Sat_18.41-PM
	sudo chmod ugo+rx -R /am/cruc4tb/koofry/volums/vd70-bakup

#  --bwlimit=540m --info=progress2 --progress \

