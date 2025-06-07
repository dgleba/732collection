
# pt-archiver --help
set -x

mkdir -p /tmp/perco
# ls -la /tmp/perco

pt-archiver --source h=10.4.1.245,P=6601,D=dkrdb,u=muser,p=wsj.231.kql,t=mydates  \
    \
    --where 'mydate  <  date_sub( now(), interval 3 hour )'  \
    \
    --dest h=10.4.1.245,P=6601,D=dkrdb,u=muser,p=wsj.231.kql,t=mydates_archive   \
    \
    --limit=100  --why-quit  2>&1>>/tmp/perco/mydates-arch.log

pwd

tail  /tmp/perco/mydates-arch.log


# eg:
#
# pt-archiver --source h=192.168.88.60,P=7411, D=dkrdb, t=data1, u=root, p=iof  \
#   --where 'id < 3'  \
#   --dest h=192.168.88.60,P=7411, D=dkrdb, t=data_archive1, u=root, p=iof   \
#   --limit=1 --no-delete --why-quit 2>&1 >> archive01.log


# test:
#     select date_sub( now(), interval 280 minute)


