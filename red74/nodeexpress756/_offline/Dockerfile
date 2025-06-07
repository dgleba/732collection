FROM node:14.15-alpine

# RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
# USER node

# might need these here. they are in docker-compose.yml. 
# WORKDIR /app
# EXPOSE 8080

COPY package*.json ./

# RUN npm install

# COPY --chown=node:node . .

CMD [ "node", "start" ]
