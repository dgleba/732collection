date
	db=dkrdb && BACKUP_DIR="/crib";
    mysqldump --user=$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD --databases "${db}" --add-drop-database --routines --events --flush-privileges --allow-keywords  \
       | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/t1/"${db}"_mysqldump_typ1.sql"

