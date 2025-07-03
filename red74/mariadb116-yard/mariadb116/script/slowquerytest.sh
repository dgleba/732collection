	date
	cd /srv/dkr/mysql519 
	
    source /home/albe/shc/21env.sh
	
    
    # see if db is running..

    mysql  --host=127.0.0.1 --port=3308 -u dg417 -p$mysqluserpass -e "show databases;";
      (($? != 0)) && { printf '%s\n' "Problem: Command exited with non-zero"; exit 1; } # Test exit code of command above and exit if non-zero

    read -rsp $'Wait xx Seconds or Press escape to continue...\n' -t 111 -d $'\e'
	
    date
	date1=$(date)
	
    mysql  --host=127.0.0.1 --port=3308 -u dg417 -p$mysqluserpass -e "use prodrptdb; select * from barcode;";
      (($? != 0)) && { printf '%s\n' "Problem: Command exited with non-zero"; exit 1; } # Test exit code of command above and exit if non-zero

	date
	echo date1=$date1
