
echo 
echo  ~~~~~~~ Starting production-gfx-01.sh  Rev: s40 -  $(date +"%Y.%m.%d_%H.%M.%S")
echo

# pt-archiver --help
set -x

# mkdir -p /tmp/perco
# ls -la /tmp/perco
# pwd


pt-archiver --config /code/start02gfxproduction.conf  --statistics --pid 987123.ptarchiver.pid \
--commit-each  --limit=1000  --sleep=35    --progress=1000 --why-quit --run-time=120m  --check-interval=61   \
--where "TimeStamp < UNIX_TIMESTAMP(DATE_SUB(NOW(), INTERVAL 31 day))" >> /proc/1/fd/1 2>&1  


echo
echo
echo  ~~~~~~~~ ending production-gfx-01.sh  -  $(date +"%Y.%m.%d_%H.%M.%S")
echo
echo


# =================================================

# current notes:

# 2022-11-04_Fri_09.02-AM: added
# --check-slave-lag --max-lag=60 --check-interval=61 \



# --commit-each --limit=1000  --sleep=19 --progress=1000 || this archives about 3-4 million records a day. 2022-10-03

# It didn't seem t to stop. just wait a long time. I added --run-time=220m get it to stop and rest. cron is every 4 hours, so this 220m is less.



# =================================================

# older notes:

# --sleep=19  --sleep-coef=4900 

# --sleep-coef=0.5 >> /alog/pt-arch-log.$(date +"%Y.%m.%d_%H.%M.%S").txt  2>&1 


# pt-archiver --config /code/production-gfx01.conf --statistics --where 'id < 11'

# --where="mydate  <  date_sub( now(), interval 60 minute )" 


# tail  /code/mydates-arch.log


# eg:
#
# pt-archiver --source h=192.168.88.60,P=7411, D=dkrdb, t=data1, u=root, p=iof  \
#   --where 'id < 3'  \
#   --dest h=192.168.88.60,P=7411, D=dkrdb, t=data_archive1, u=root, p=iof   \
#   --limit=1 --no-delete --why-quit 2>&1 >> archive01.log


# test:
# select date_sub( now(), interval 280 minute)


# https://www.percona.com/doc/percona-toolkit/LATEST/pt-archiver.html
# https://forums.percona.com/t/pt-archiver-and-using-a-config-file/2835

# =================================================
