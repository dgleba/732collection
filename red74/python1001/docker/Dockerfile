
FROM python:3.11
# FROM ubuntu:22.04

WORKDIR /code

RUN whoami

# RUN  mkdir -p /pipcache 
# RUN  chown -R "0:33"  /rootzzz
# USER "0:33"


RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y cron


# Install cron
# RUN apt-get update 
# RUN  apt-get install -y cron 

# Install dependencies for django-auth-ldap..
RUN apt-get install -y  libldap2-dev libsasl2-dev libssl-dev

RUN apt install python3-pip -y

ADD requirements.txt /code/
RUN pip3 install  -r requirements.txt

RUN  chmod -R g+rws  /code

# ADD  --chmod=0755  entrypoint.sh /code/

ADD  entrypoint.sh /home
RUN  chmod  +x  /home/entrypoint.sh

# use volume in docker-compose..
# COPY . /code/

ENTRYPOINT ["/home/entrypoint.sh"]