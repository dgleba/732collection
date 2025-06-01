

# Ref

https://github.com/davide/adminer-sqlite

David Gleba
2020-09-12_Sat_16.08-PM



# Readme

This projects includes a Dockerfile to bundle adminer (sqlite) as part of a Docker image.

$ docker run -d -e DB_PATH=/data/database.sqlite -e DB_USER=admin -e DB_PASS=admin_pass nesrait/adminer-sqlite

Adminer overview
----------------

  - https://www.adminer.org/
  - http://www.otak.info/index.php?page=postDetailReplyList&post=130&page_num=1&title=SQLite+Adminer+-+login
