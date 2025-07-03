FROM python:3.12-slim

WORKDIR /code

RUN whoami

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y cron

# Install dependencies for django-auth-ldap..
RUN apt-get install -y  libldap2-dev libsasl2-dev libssl-dev

RUN apt install python3-pip -y

ADD requirements.txt /code/
RUN pip3 install  -r requirements.txt

RUN  chmod -R g+rws  /code

ADD  entrypoint.sh /code
RUN  chmod  +x  /code/entrypoint.sh

ENTRYPOINT ["/code/entrypoint.sh"]