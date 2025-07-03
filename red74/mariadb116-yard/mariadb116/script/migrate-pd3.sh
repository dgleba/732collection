#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-03[Jun-Wed]20-06PM 

# 1

  # export current db
    date
    cd   /home/albe/backup/mysql_indiv; /var/www/html/0docs-pmdsdata/mysql-bk7-indiv-db.sh
    # create export for comparison to that imported on new db system
    cd /srv/dkr/mysql519 ; bash ./comparedb-pd3.sh
    date

# 2

  # move files to import area
  date; cd /home/albe/backup/mysql_indiv
  src=*; # * ignores .files . will take everything.
  dst=/srv/dkr/mysql519/sysdata/in-out;

  #
  # Turn off this migration by comenting this out....
  #
  # rsync -av  --remove-source-files $src $dst && find $src/ -depth -type d  -empty -exec rmdir "{}" \;
  
  date


# 3

  # import to new db
  cd /srv/dkr/mysql519
  
    # used June 7 2020 now disabled
    # make imp


# 5.

  # compare current to new db
  date
  # moved current db export to step 1 above.
  make cmp
  date
 



# 4

  
  #check db file sizes to see if they are exploding in size or not.
  ft=./x/my.size.txt
  sudo ls
  date
  cd /srv/dkr/mysql519
  cd /srv/dkr/mysql519
  mkdir -p x
  date  |tee -a $ft
  sudo du -h sysdata/mysqldata |sort -h |tee -a $ft
  date  |tee -a $ft
  sudo du  sysdata/mysqldata |sort -h  |tee -a $ft
  date  |tee -a $ft
  date  |tee -a $ft.find
  sudo find  ./sysdata/mysqldata  -type f -print0 | sudo xargs -0 stat --printf='%.16y %A %h %U\t%G\t%s\t%n\n' | sort -n -k 7,7 |  grep -v '.git/' | tail -n50  |tee -a $ft.find
  date  |tee -a $ft.find



#end

  echo "reached end of migrate. 34dekr34."



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-06-04[Jun-Thu]14-24PM 


