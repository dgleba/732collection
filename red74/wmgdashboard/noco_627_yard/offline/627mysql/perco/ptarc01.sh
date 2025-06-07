

# make mkd  --  to make the source data table.


# pt-archiver --help
set -x

# cd /home/perconatoolkit
# whoami
# cd
# ls -la
# chmod -R 777 /app
# mkdir -p /tmp/out
# touch /tmp/perco/a.txt

mkdir -p /tmp/perco

ls -la /tmp/perco

pt-archiver --source h=192.168.88.60,P=7411,D=dkrdb,t=data1,u=root,p=iof  \
  --where 'id < 5'  \
  --dest h=192.168.88.60,P=7411,D=dkrdb,t=data1_archive,u=root,p=iof   \
  --limit=1  --why-quit | tee -a /tmp/perco/arch.log

pwd

# pt-archiver --source h=192.168.88.60,P=7411, D=dkrdb, t=data1, u=root, p=iof  \
#   --where 'id < 3'  \
#   --dest h=192.168.88.60,P=7411, D=dkrdb, t=data_archive1, u=root, p=iof   \
#   --limit=1 --no-delete --why-quit 2>&1 >> archive01.log


# tail -f /dev/null

