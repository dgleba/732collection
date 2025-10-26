echo 
echo  Starting ..pt_sync_prodrptdb3-2_dot-sh  Rev: 07 -  $(date +"%Y.%m.%d_%H.%M.%S") $TESTVAR
echo  sync from pd3 to pd6-3306
set -x
pwd

# =================================================

gfx02_test_flock () {
echo sleep
sleep 20
echo end
}


batch02 () {
array2=( 
tkb_weekly_goals
)
for a3 in "${array2[@]}" ; do  
echo $a3 ; date;
    pt-table-sync  h=10.4.1.224,P=3306,u=admin2,p=rde2768intel,D=prodrptdb,t=$a3  \
        h=10.4.1.245,P=3306,u=admin2,p=$admin2pw,D=prodrptdb,t=$a3   \
        --verbose   --execute   --pid=pidfile_pt-tbl-sync_0008.system \
           | tee -a /alog/pr3weekgoal_$(date +"%Y.%m.%d").log   
done 
}



# =================================================

# start here

func_exit () {
echo "Exiting, maybe another instance is running."; exit 1
}

(
  flock -n 9 || func_exit
  # put commands executed under lock here...
  batch02
  # echo "~~~~~~~~~~  Run a second time  ~~~~~~~~~~~~~~~~~~~~~~~~~~"
  # gfx01
) 9>"/var/lock/lockfile_2023-09-26__350_$USER"


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

