

#@################################################################
#@  
#@  Title:::  
#@  
#@###################################   2026-01-18[Jan-Sun]17-10PM 


https://pg-chameleon.readthedocs.io/en/ver2.0/usage.html#example

https://github.com/the4thdoctor/pg_chameleon/blob/main/pg_chameleon/configuration/config-example.yml


usage:

	dc up
	
	


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~












S P A C E R  










S P A C E R  












~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	NOTES..
	
	

------------


chameleon set_configuration_files

# Initialise the replica

chameleon create_replica_schema --debug

chameleon add_source --config default  --debug --source mysql

chameleon init_replica --config default --debug --source mysql


------------

restart..


chameleon stop_replica --config default --source mysql
chameleon enable_replica --config default --source mysql 
chameleon start_replica --config default --source mysql



------------


ideas:

chameleon show_status --source mysql

chameleon show_config

chameleon show_errors

chameleon copy_schema --source mysql

chameleon sync_tables --source mysql --tables delphis_mediterranea.foo



------------


INSERT INTO delphis_mediterranea.foo (tiny_flag, payload, updated_at) VALUES(1, '423b', '2026-01-18 20:27:33');

INSERT INTO delphis_mediterranea.foo (tiny_flag, payload) VALUES(1, '553');


------------

=================================================

    command: >
        bash -c "
        chameleon set_configuration_files;
        chameleon create_replica_schema --debug &&
        chameleon add_source --config default  --debug --source mysql &&
        chameleon init_replica --config default --debug --source mysql &&
        chameleon start_replica --config default --source mysql --debug &&
        tail -f ~/.pg_chameleon/logs/*.log;
        "




=================================================

