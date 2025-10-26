
1.

2020-09-04 

	sftp://albe@10.4.1.224/srv/dkr/mysql519/docker-compose.yml
	
	from:
	
    volumes:
      - .:/root # folder for scripts, etc.
	
	to:
	
    volumes:
      - ./script:/script

	Should not mount . into container. Can take too many items in..

	This will break some things. Edit them to correct them as needed later.
	
	
	
	