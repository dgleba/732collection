#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  backup indiv dbs except those in exclude list..

usage: 

 see makefile


END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

main1()
{


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# get list of db's
  # databases=`$MYSQL --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "SHOW DATABASES;" | grep -Ev \
  #  "(cmmdb|greygold|prodrptdb_archive|argo|ignition|test|rail_test|mysql|information_schema|performance_schema|Database)"`   # see exclude list to the left on this line.


# or


# get list of db's
  databases=`$MYSQL --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "SHOW DATABASES;" | grep -Ev \
    "(mysql|information_schema|performance_schema|Database)"`   # see exclude list to the left on this line.

# or

  # databases="dgnote130 dkrdb rptdb qualitydb"
  # databases="lukup hrdb qualitydb dgnote130"
  # databases="prod367db"


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




  echo $databases 

  for db in $databases; do
    echo "${db}"
    
    # bad options... $MYSQLDUMP --force --opt --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD    --databases "${db}" --complete-insert --quote-names  --allow-keywords \
     #  --skip-add-drop-table --add-drop-database  --skip-lock-tables  --no-tablespaces --no-create-info --routines \
     #  --events  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/t1/"${db}"_mysqldump_typ1.sql"
    

    # added timestamp to filename. 2020-08-11

    $MYSQLDUMP --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD --databases "${db}" --add-drop-database --routines --events --flush-privileges --allow-keywords  \
       | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/t1/"${db}"_mysqldump_typ1.$(date +"%Y-%m-%d_%H.%M.%S").sql"

    #echo t2
    #  $MYSQLDUMP --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD    --databases "${db}" --add-drop-database --routines --events --flush-privileges \
    #     | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/"${db}"_mysqldump_typ2.sql"

    #echo t3
    #  $MYSQLDUMP --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD --databases "${db}" | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/"${db}"_mysqldump_typ3.sql"
    #
    # with folder...
    #  $MYSQLDUMP --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD --databases "${db}" | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/t3/"${db}"_mysqldump_typ3.sql"


    # -d = structure only all tables
    #
    $MYSQLDUMP --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -d --databases "${db}"  \
        --add-drop-database  --routines --events --flush-privileges --complete-insert --allow-keywords \
        | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/stru/"${db}"_struc_mysqldump.$(date +"%Y-%m-%d_%H.%M.%S").sql"
  done

}

special()
{
  # special db..

  databases="mysql information_schema"

  echo $databases 
  for db in $databases; do
    echo "Special db mysql infoschema.. ${db}"
    
    $MYSQLDUMP --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD --databases "${db}" --add-drop-database --routines --events --flush-privileges --allow-keywords  \
       --single-transaction  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/spec/"${db}"_mysqldump_typ1.$(date +"%Y-%m-%d_%H.%M.%S").sql"

    # -d = structure only all tables
    #
    $MYSQLDUMP --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -d --databases "${db}"  \
        --add-drop-database  --routines --events --flush-privileges --complete-insert --allow-keywords  \
        --single-transaction  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/stru/"${db}"_struc_mysqldump.$(date +"%Y-%m-%d_%H.%M.%S").sql"
  done

}



# =================================================

# start here..


  TIMESTAMP=$(date +"%F")

  BACKUP_DIR="/crib"

  # get from env or..
  # MYSQL_ROOT_USER="root"
  # see below..  MYSQL_PASSWORD="$mysqlrootpassw"

  MYSQL=mysql
  #MYSQLDUMP=/usr/bin/mysqldump
  MYSQLDUMP=mysqldump

  mkdir -p "$BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"/t1
  mkdir -p "$BACKUP_DIR"/t2
  mkdir -p "$BACKUP_DIR"/t3
  mkdir -p "$BACKUP_DIR"/stru
  mkdir -p "$BACKUP_DIR"/spec
   

# export db's
main1

# export special db's
special

#
date
#

