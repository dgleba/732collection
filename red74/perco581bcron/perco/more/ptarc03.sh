
echo 
echo  Starting ptarc03.sh  Rev: 3 -  $(date +"%Y.%m.%d_%H.%M.%S")

# pt-archiver --help
set -x

# mkdir -p /tmp/perco
# ls -la /tmp/perco
# pwd

pt-archiver --config /code/ptarc03.conf --statistics --where="mydate  <  date_sub( now(), interval 60 minute )" 


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

