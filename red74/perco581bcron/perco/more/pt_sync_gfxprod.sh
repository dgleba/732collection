echo 
echo  Starting ..pt_sync_gfxprod-dot-sh  Rev: 04 -  $(date +"%Y.%m.%d_%H.%M.%S") $TESTVAR
echo  sync from pd3 to pd6-docker-port-6601
set -x
pwd

# =================================================

gfx02_test_flock () {
echo sleep
sleep 20
echo end
}

gfx01 () {

# --------------------

#gfxproduction..

# sync recent.
dayago=$(date --date="1 hour ago" "+%Y-%m-%d %H:%M:%S")
minago=8
dayagou=$(date --date=" $minago minute ago" +%s)
echo "Sync Where Minutes ago is: $minago"
tt="Id>48617872"
echo ${dayago} ${dayagou} $tt
#
date
pt-table-sync  h=10.4.1.245,P=3306,u=admin2,p=$admin2pw,D=prodrptdb,t=GFxPRoduction  \
     h=10.4.1.245,P=6601,u=root,p=$MYSQL_ROOT_PASSWORD,D=django_pms,t=GFxPRoduction   \
    --verbose   --execute   --pid=pidfile_pt-tbl-sync_0043.system \
      --where "TimeStamp>$dayagou"     

# --------------------

}



# =================================================

# start here

func_exit () {
echo "Exiting, maybe another instance is running."; exit 1
}

(
  flock -n 9 || func_exit
  # put commands executed under lock here...
  gfx01
  #batch02
  # echo "~~~~~~~~~~  Run a second time  ~~~~~~~~~~~~~~~~~~~~~~~~~~"
  # gfx01
) 9>"/var/lock/lockfile_2023-02-28__349_$USER"


# tkb0
# scprhr1
# scprhr1b

pwd
date

# =================================================

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment21 {
: <<'BLOCKCOMMENT'

# notes:

BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

