





echo 
echo  Starting ....sh  Rev: 3 -  $(date +"%Y.%m.%d_%H.%M.%S")

# pt-archiver --help
set -x

mkdir -p /tmp/perco
# ls -la /tmp/perco

# works.
pt-table-sync  h=10.4.1.245,P=3306,D=dgnote130,u=stuser,p=stp383,t=name1innodb  \
    \
     h=10.4.1.245,P=6601,D=dkrdb,u=muser,p=wsj.231.kql,t=name1innodb   \
    \
    --execute --verbose
    


# works.
pt-table-sync  h=10.4.1.245,P=3306,u=stuser,p=stp383  \
    \
     h=10.4.1.245,P=6601,u=muser,p=wsj.231.kql   \
    \
    --execute --verbose --databases=dgnote130 --ignore-tables="books,tbla"
    

# does nothing. Is it because source is mysql 5.5?
pt-table-sync  h=10.4.1.224,P=3306,u=stuser,p=stp383  \
    \
     h=10.4.1.245,P=6601,u=muser,p=wsj.231.kql   \
    \
    --execute --verbose --databases=dgnote130 --ignore-tables="books,tbla"
    

# does nothing. 
pt-table-sync  h=10.4.1.224,P=3306,u=stuser,p=stp383  \
    \
     h=10.4.1.245,P=6601,u=muser,p=wsj.231.kql   \
    \
    --execute --verbose --databases=test2 --ignore-tables="projects,tbla"
    


pwd




# notes:

# tail  /code/mydates-arch.log
    # 2>&1>>/code/mydates-arch.log

    # --where 'mydate  <  date_sub( now(), interval 70 minute )'  \

# eg:
#
# pt-archiver --source h=192.168.88.60,P=7411, D=dkrdb, t=data1, u=root, p=iof  \
#   --where 'id < 3'  \
#   --dest h=192.168.88.60,P=7411, D=dkrdb, t=data_archive1, u=root, p=iof   \
#   --limit=1 --no-delete --why-quit 2>&1 >> archive01.log


# test:
# select date_sub( now(), interval 280 minute)


# source=h=10.4.1.224,P=3306,D=prodrptdb,u=dg417,p=dg,t=GFxPRoduction

# dest=h=10.4.1.224,P=3306,D=prodrptdb,u=dg417,p=dg,t=GFxPRoduction_archive

