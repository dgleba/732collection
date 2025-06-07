# This

Purpose: mysql-573-t docker for percona pt-archiver and ofelia test


This repo has percona tools available and ofelia cron-like-scheduler for docker.

See other docs in this repo. __status....txt may have brief info.


# Instructions

This file is at:  `10.4.1.231/srv/dkr/mysql-570a-yard/README.md`

mysql is running at:  `10.4.1.231`  port: `7311`

   (see docker-compose.yml in case ports were changed.)

see   `./mysql570b/.env` for passwords


## adminer:

```
http://10.4.1.231:7312/?server=dbm

```


## phpmyadmin:

```
http://10.4.1.231:7314/

```

use server: `dbm`

See pic at:  `./docs/login-phpMyAdmin.jpg`


## Ports:


```
see ./docker-compose.yml

```

# how to

See also: `Makefile`

for initial startup try `bash mysql580b/startsh`



# OLD make data

`make mkd`




# End of Current info





```
























# -
# -
# -
# -
# -

# older stuff below..

# -
# -
# -
# -
# -












```


# This 

https://github.com/dgleba/482dkrcollection/mysqlsimple5


# Quick Start

```
git clone https://github.com/dgleba/482dkrcollection 
cd 482dkrcollection/mysqlsimple5/
cp example.env .env
docker-compose up
```

Visit adminer at http://your-ip-address:6117/    (port is specified in docker-compose.yml)

Login with..
```
- server - dbm     (database service name specified in docker-compose.yml)
- username - root
- password - pw    (password is specified in .env)
```



# Note

 The rest of this readme was copied from https://github.com/dgleba/392dkr. It hasn't been edited here, but the ideas should be valid.




# -
# -
# -


# This is - Dkr392

This repo is a docker system of mysql backend on external network, demonstrate function using php.



## Installation:

To run it:  

Install docker and docker-compose. I run it on linux ubuntu 16.04.

I used:
```
docker --version
Docker version 18.03.0-ce, build 0520e24
docker-compose -version
docker-compose version 1.21.2, build a133471
```


```
cd /srv/dkr/
git clone  https://github.com/dgleba/dkr389sys.git 
cd dkr389sys
```

## For more instructions

See `instructions...txt.md` and Makefile for more info



##

Visit http://pmdsdata4:6103/?server=dbm&username=root

use 

System	mysql
Server	dbm
Username root
Password	root
Database	

The key is dbm is the server name/ipaddress. It is the service name in the docker-compose.yml

Each docker-compose had external network defined, so this joins them all.



## This is

This: https://github.com/dgleba/392dkr  - tbd

David Gleba dgleba@gmail.com
