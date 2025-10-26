
# https://github.com//node-red/node-red-docker

# FROM nodered/node-red:latest
From nodered/node-red:4.0-debian

RUN whoami

# Optional: Install Python packages if needed
USER root

RUN whoami

# add zscaler cert..
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y ca-certificates 
# RUN apt-get install -y ca-certificates;
ADD zscaler-rc.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates

# Install additional npm packages
RUN npm install node-red-contrib-home-assistant-websocket \
    && npm install node-red-contrib-bigtimer 


#RUN apk add --no-cache py3-pip \
#    && pip3 install requests prettyprinter beautifulsoup4 click

#USER node-red  # Switch back to the non-root user

