# https://github.com/node-red/node-red-docker/blob/master/.docker/Dockerfile.debian
# https://github.com//node-red/node-red-docker

# FROM nodered/node-red:latest
From nodered/node-red:4.1-debian

RUN whoami
RUN pwd

# Optional: Install Python packages if needed
USER root

RUN whoami

# add zscaler cert..
RUN apt-get update && \
    apt-get install -y ca-certificates mc ncdu
ADD zscaler-rc.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates


# Install additional npm packages
#RUN npm install node-red-contrib-home-assistant-websocket \
 #   && npm install node-red-contrib-bigtimer 


#RUN apk add --no-cache py3-pip \
#    && pip3 install requests prettyprinter beautifulsoup4 click

# this didn't have an effect..
# RUN chown -R node-red:node-red /usr/src/node-red

USER node-red
RUN whoami
RUN pwd


