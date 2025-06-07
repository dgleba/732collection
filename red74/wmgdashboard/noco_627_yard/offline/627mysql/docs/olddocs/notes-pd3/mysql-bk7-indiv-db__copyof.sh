#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  backup cmmdb for mariadb columnstore
END



usage: 

          cd   /home/albe/backup/mysql_indiv; /var/www/html/0docs-pmdsdata/mysql-bk7-indiv-db.sh


mysql to get db names...:
            show databases
          
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#cd ; 
date ; set +vx  ; set -vx ; # echo off, then echo on
echo $(date +"%Y-%m-%d_%H.%M.%S")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

main1()
{

# http://stackoverflow.com/questions/11901344/skip-or-ignore-definers-in-mysqldump  for views..
#   mysqldump -u dbuser -p dbname | grep -v 'SQL SECURITY DEFINER' > dump.sql
#     test...  reprocess.. cat pmdsdata3-some-mysql.sql | grep -v 'SQL SECURITY DEFINER' > pmdsdata3-some-mysql9.sql
set +vx
cd ; source shc/21env.sh
set -vx

mkdir -p /home/albe/backup/mysql_indiv ; cd       /home/albe/backup/mysql_indiv;
mkdir -p ./stru
mkdir -p ./spec


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# backup each database as follows..
dbarray=( 
dgnote130
leanmfg
prod367db
) 

dbarray_notbackingup=( 
greygold
prodrptdb_archive
cilist
emptydb
hrdb
hrdb_dev
ignition
lukup
lukup_pub
metabasedb
phpmyadmin
prodrptdb
qualitydb
shift_smsmeer
shiftcsd1
shiftcsd1suprv
shiftcsd2
shiftcsd2suprv
mysql
information_schema
performance_schema
)

dblist=(`mysql --host=127.0.0.1 --user=root --password=$mysqlrootpassw -e "SHOW DATABASES;" | grep -Ev \
   "(Database|mysql|information_schema|performance_schema|a_this_pd3)"`)   # see exclude list to the left on this line.

# dblist=(`mysql --user=root --password=$mysqlrootpassw -e "SHOW DATABASES;" | grep -Ev \
#    "(Database|information_schema)"`)   # see exclude list to the left on this line.

   
echo $dblist
echo dblistarray..
echo ${dblist[*]}
echo dbarray..
echo ${dbarray[*]}
 
sleep 2
 
#
# bktables_seperate()
itable1="tblx"
itable2="tbly"

date
for patrn in "${dbarray[@]}"
do
  # dump regular 
  # May need these to use port not socket..  --host=10.4.1.224 --port=3308 
  # or just move it to mysql519 docker.
  mysqldump --host=127.0.0.1 --user=root --password=$mysqlrootpassw --databases $patrn    \
    --add-drop-database --routines --events --flush-privileges  | grep -v 'SQL SECURITY DEFINER' > pmdsdata3-$patrn-regulr-mysql.sql
    
  # 2020-05-29 
  # mysqldump --user=root --password=$mysqlrootpassw --databases $patrn --ignore-table $patrn.$itable1  --ignore-table $patrn.$itable2  \
  #   --opt --net_buffer_length=500196 --create-options --add-drop-database --skip-lock-tables --quote-names | grep -v 'SQL SECURITY DEFINER' \
  #   > pmdsdata3-$patrn-regulr-mysql.sql
    
    
  # dump regular 
  # pre20200517... 
  # mysqldump --user=root --password=$mysqlrootpassw --databases $patrn --ignore-table $patrn.$itable1  --ignore-table $patrn.$itable2  \
  #  --complete-insert --quote-names --allow-keywords --routines --events --add-drop-database --skip-lock-tables | grep -v 'SQL SECURITY DEFINER' \
  #  > pmdsdata3-$patrn-regulr-mysql.501.sql

  # dump with no create table statements.. some tables
  # mysqldump --user=root --password=$mysqlrootpassw --databases $patrn  --tables $itable1 $itable2  --where="1 limit 1000" \
    # --complete-insert --quote-names --allow-keywords --skip-add-drop-table --no-tablespaces --no-create-info  | grep -v 'SQL SECURITY DEFINER' \
    # > pmdsdata3-$patrn-spectables-mysql.sql
    # | sed 's/\ ENGINE=InnoDB/\ ENGINE=columnstore/g' | sed 's/\ ENGINE=MyISAM/\ ENGINE=columnstore/g' \
 
  # dump with no create table statements.. rest of the tables..
  #offline..  mysqldump --user=root --password=$mysqlrootpassw --databases $patrn  --ignore-table $patrn.$itable1  --ignore-table $patrn.$itable2 \
    # --complete-insert --quote-names --allow-keywords --skip-add-drop-table --no-tablespaces --no-create-info | grep -v 'SQL SECURITY DEFINER' \
    # > pmdsdata3-$patrn-rest-mysql.sql
    # | sed 's/\ ENGINE=InnoDB/\ ENGINE=columnstore/g' | sed 's/\ ENGINE=MyISAM/\ ENGINE=columnstore/g' \
   
   
  # -d = structure only all tables
  mysqldump --host=127.0.0.1 --user=root --password=$mysqlrootpassw -d --databases $patrn   \
    --add-drop-database  --routines --events --flush-privileges --complete-insert --allow-keywords \
    | grep -v 'SQL SECURITY DEFINER' > pmdsdata3-$patrn-struc-mysql.sql
    
  # | sed 's/\ ENGINE=InnoDB/\ ENGINE=columnstore/g' | sed 's/\ ENGINE=MyISAM/\ ENGINE=columnstore/g' | grep -v '\ KEY\ ' > pmdsdata3-$patrn-struc-mysql.sql
  


  # Make folders..
  #
  # mkdir -p $patrn


  # Export to tsv files..
  # sudo mysqldump --user=root --password=$mysqlrootpassw --tab=$patrn $patrn --tables $itable1 --where="1 limit 995262062"
  
  # mysqldump --user=root --password=$mysqlrootpassw --tab=$patrn $patrn --tables $itable1 --where="sql_id>=1 and sql_id<=23"
  # mysqldump --user=root --password=$mysqlrootpassw --tab=$patrn $patrn --tables $itable2 --where="id>=1 and id<=31"
  
done


  # special db..

  databases="mysql information_schema"

  BACKUP_DIR="/home/albe/backup/mysql_indiv"
  MYSQL_USER="root"
  MYSQL_PASSWORD="$mysqlrootpassw"
  MYSQLDUMP=mysqldump

  echo $databases 
  for db in $databases; do
    echo "Special db mysql infoschema.. ${db}"
    
    $MYSQLDUMP --host=127.0.0.1 --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases "${db}" --add-drop-database --routines --events --flush-privileges --allow-keywords  \
       --single-transaction  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/spec/"${db}"_mysqldump_typ1.sql"

    # -d = structure only all tables
    #
    $MYSQLDUMP --host=127.0.0.1 --user=$MYSQL_USER -p$MYSQL_PASSWORD -d --databases "${db}"  \
        --add-drop-database  --routines --events --flush-privileges --complete-insert --allow-keywords  \
        --single-transaction  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/stru/"${db}"_struc_mysqldump.sql"
  done


date
#

sleep 1

}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

main1
#
date

#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~






















# exit so the following notes have no effect..

set +vx
return 0
echo willnotrun

offlinenotes()
{

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-09-21[Sep-Thu]23-31PM

notes:

array99=(
leanmfg
greygold
leanmfg 
cilist 
shiftcsd1
)



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#  #  #  #  backup cmmdata database as follows and ignore data table in sql export..
array1=( 
#xx--cmmdb
) 
#
date
for patrn in "${array1[@]}"
do
  echo $patrn 
  mysqldump --user=root --password=$mysqlrootpassw --databases $patrn --ignore-table=$patrn.cmmdata --complete-insert --quote-names --add-drop-database --allow-keywords \
    | grep -v 'SQL SECURITY DEFINER'  > pmdsdata3-$patrn-withoutmaindata-mysql.sql
  
  # -d = structure only
  mysqldump --user=root --password=$mysqlrootpassw -d --databases $patrn --complete-insert --quote-names --add-drop-database --allow-keywords | grep -v 'SQL SECURITY DEFINER' \
   # | sed 's/\ ENGINE=InnoDB/\ ENGINE=columnstore/g' | sed 's/\ ENGINE=MyISAM/\ ENGINE=columnstore/g' \
     > pmdsdata3-$patrn-struc-mysql.sql

  mkdir -p $patrn
  # Export to tsv files..
  sudo mysqldump --user=root --password=$mysqlrootpassw --tab=$patrn $patrn 

done
date
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

}




 