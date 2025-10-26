FROM ubuntu:20.04
# MAINTAINER David Gleba

# Install cron
RUN apt-get update && apt-get install -y cron 

# install rsyslog if needed for debugging cron
# RUN  apt-get install -y  rsyslog
# https://github.com/yuuki0xff/docker-percona-toolkit/blob/master/Dockerfile
# ARG DEBIAN_VERSION=buster
# FROM debian:${DEBIAN_VERSION}
LABEL  maintainer "Was - yuuki0xff <yuuki0xff@gmail.com>"

ENV PERCONA_VERSION 3.4
ENV RELEASE_VERSION 3.4.0

RUN  apt-get install -y \
      libdbd-mysql-perl \
      libdbi-perl \
      libio-socket-ssl-perl \
      libterm-readkey-perl \
      perl \
      wget \
      && rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/* && \
      wget -O percona-toolkit.deb https://downloads.percona.com/downloads/percona-toolkit/3.2.1/binary/debian/focal/x86_64/percona-toolkit_3.2.1-1.focal_amd64.deb && \
      dpkg -i percona-toolkit.deb 
      

# notes..      

# wget -O percona-toolkit.deb https://downloads.percona.com/downloads/percona-toolkit/3.2.1/binary/debian/bionic/x86_64/percona-toolkit_3.2.1-1.bionic_amd64.deb && \

# wget -O percona-toolkit.deb https://www.percona.com/downloads/percona-toolkit/${PERCONA_VERSION}/binary/debian/${DEBIAN_VERSION}/x86_64/percona-toolkit_${RELEASE_VERSION}.${DEBIAN_VERSION}_amd64.deb && \
#   && \
#   rm -f percona-toolkit.deb

