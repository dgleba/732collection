echo 
echo  Starting ..pt_sync_prodrptdb3--sh  Rev: 26 -  $(date +"%Y.%m.%d_%H.%M.%S") $TESTVAR
startpdb3=$(date +"%Y.%m.%d_%H.%M.%S");
startts=$(date +"%s");
echo " var startpdb3 ${startpdb3} ${startts}" 
set -x
pwd


# =================================================

main1 () {

array2=( 

1scrap_line_operation_category
1scrap_operation_dept
1scrap_part_dept_cost
1scrap_part_line
about_this_app
analysis_staffing
auth_group
auth_group_permissions
auth_permission
auth_user
auth_user_groups
auth_user_user_permissions
a_direct_labour
a_direct_labour2
barcode_alarms
budget_manpower
dashboard
dataface__failed_logins
dataface__modules
dataface__mtimes
dataface__preferences
dataface__record_mtimes
dataface__version
data_scrap_production
django_admin_log
django_content_type
django_migrations
django_session
machine_test1
PM_CNC_Tech
pm_cnc_tech3
PM_CNC_Tech_checks
PM_CNC_Tech_due
PM_CNC_Tech_Temp
polls_choice
polls_question
prodmon_bypass_log
prodmon_machine_faults
prodmon_ping
prodmon_runstate
production_calculation
production_state
Product_Lines
pr_cell_group
pr_cell_list
pr_downtime1
pr_machine
pr_parts
pr_production
pr_productionheader
pr_who_list
quality_epv_assets
quality_epv_checks
quality_epv_week
quality_tpm_assets
role
roles_users
rpt_elist-offline
scrap_line_operation_category
scrap_line_operation_category_backup
scrap_line_operation_category_backup_1
scrap_operation_dept
scrap_part_dept_cost
scrap_part_dept_cost2
scrap_part_dept_cost_BACKUP
scrap_part_line
sc_budget
sc_continental
sc_line_man
sc_production1
sc_product_line_manpower
sc_prod_hour
sc_prod_hr_target
sc_prod_parts
staffing
temp_monitors
tkb_2hr
tkb_ab1v
tkb_allocation
tkb_asset_priority
tkb_asset_priority2
tkb_audits
tkb_audits_temp
tkb_couldbe
tkb_cycletime
tkb_cycletime1
tkb_email_10r
tkb_email_conf
tkb_employee
tkb_employee_batch
tkb_employee_matrix
tkb_employee_matrixx
tkb_employee_temp
tkb_forklift
tkb_furnace
tkb_gate_alarm
tkb_gate_alarm_log
tkb_help
tkb_inventory
tkb_inventory_fixed
tkb_inventory_ops
tkb_jobs
tkb_jobs_test
tkb_kiosk
tkb_layered
tkb_logins
tkb_manpower
tkb_manpower_costing
tkb_manpower_updater
tkb_matrix
tkb_matrix_cache
tkb_matrix_old
tkb_message
tkb_part_cat
tkb_priorities
tkb_prodtrak_justschema
tkb_production_goals
tkb_refresh_tracking
tkb_robot_list
tkb_schedule
tkb_schedule8
tkb_scheduled
tkb_scheduled_missed
tkb_scheduled_off
tkb_scheduled_temp
tkb_scrap
tkb_techs
tkb_techs_B
tkb_tech_list
tkb_ten_1
tkb_ten_target
tkb_trained
tkb_updater
tkb_users
tkb_wip_track
user
users_xataface
users__history
vacation
vacation6
vacation_backup
vacation_backup2
vacation_purge
)
for a3 in "${array2[@]}" ; do  
echo $a3 ; date;
    pt-table-sync  h=10.4.1.224,P=3306,u=admin2,p=rde2768intel,D=prodrptdb,t=$a3  \
        h=10.4.1.245,P=3306,u=admin2,p=$admin2pw,D=prodrptdb,t=$a3   \
        --verbose   --execute   --pid=pidfile_pt-tbl-sync_0007.system \
           | tee -a /alog/pr3main_$(date +"%Y.%m.%d").log   
done 

}

# print all changes..  --print

#removed from list:

# track_data
# track_history
# prodmon_prod_rejects


# =================================================

# =================================================

maintst () {

array2=( 

1scrap_line_operation_category
1scrap_operation_dept
1scrap_part_dept_cost
1scrap_part_line
about_this_app
analysis_staffing
auth_group
pr_downtime1

)
for a3 in "${array2[@]}" ; do  
echo $a3 ; date;
    pt-table-sync  h=10.4.1.224,P=3306,u=admin2,p=rde2768intel,D=prodrptdb,t=$a3  \
        h=10.4.1.245,P=3306,u=admin2,p=$admin2pw,D=prodrptdb,t=$a3   \
        --verbose   --execute   --pid=pidfile_pt-tbl-sync_0005.system \
        --print   | tee -a /alog/pr3main2_$(date +"%Y.%m.%d").log   
done 

}
# =================================================


scpr1 () {

tbl=sc_production1
# sync recent.
dayago=$(date --date="7 days ago" "+%Y-%m-%d")
tt="pdate>=${dayago}"
echo ${dayago} ${dayagou} $tt
#
date
pt-table-sync  h=10.4.1.224,P=3306,u=admin2,p=rde2768intel,D=prodrptdb,t=$tbl  \
     h=10.4.1.245,P=3306,u=admin2,p=$admin2pw,D=prodrptdb,t=$tbl  \
    --verbose   --execute   --pid=pidfile_pt-tbl-sync_0006.system \
        --where $tt    --print   | tee -a /alog/pr3_$(date +"%Y.%m.%d").log   

}

# --------------------
# --where $tt 
# tee -a /alog/pr3_$(date +"%Y.%m.%d_%H.%M.%S").log  
# =================================================



# =================================================

# start here

func_exit () {
echo "Exiting, maybe another instance is running."; exit 1
}

(
  flock -n 9 || func_exit
  # put commands executed under lock here...
    main1
  # echo "~~~~~~~~~~  Run a second time  ~~~~~~~~~~~~~~~~~~~~~~~~~~"
  # gfx01
) 9>"/var/lock/lockfile_2023-04-08__pt_sync_prodrptdb3.sh_$USER"



# maintst
# tkb0
# scprhr1
# scprhr1b

pwd
date
endts=$(date +"%s");
echo  ENDing ..pt_sync_prodrptdb3--sh   at  $(date +"%Y.%m.%d_%H.%M.%S")  startpdb3 was ${startpdb3} duration sec.. $(( $endts - $startts ))


# =================================================


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment21 {
: <<'BLOCKCOMMENT'

# notes:

BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

