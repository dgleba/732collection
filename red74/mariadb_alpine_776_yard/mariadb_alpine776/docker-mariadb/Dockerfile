# Using 3.20 led to installing mariadb 10.x
# FROM yobasystems/alpine:3.20.2

# Using alpine 3.21 led to installing mariadb 11.4.x
FROM alpine:3.21

ARG BUILD_DATE
ARG VCS_REF

# RUN apk add mariadb=11.4
# RUN apk add mariadb-client~11.4
# RUN apk add mariadb-server-utils~11.4 
# RUN apk add pwgen 

RUN apk add --no-cache mariadb~11.4 mariadb-client~11.4 mariadb-server-utils~11.4 pwgen && \
    rm -f /var/cache/apk/*

ADD ./run.sh /scripts/run.sh
RUN mkdir /docker-entrypoint-initdb.d && \
    mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/scripts/run.sh"]
