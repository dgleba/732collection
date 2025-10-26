
status:


works.




_____________



goal:

    simple node docker express


_____________



howto:

dc build

dc run --rm nodejs npm init

dc run --rm nodejs npm i express

dc run --rm nodejs npm i 

# dc run nodejs npm start 
# dc run --rm  nodejs node examples/ejs/index.js




=================================================

after all is setup..


dc up




curl -i localhost:14808

        HTTP/1.1 200 OK
        X-Powered-By: Express
        ...
        Keep-Alive: timeout=5

        Hello World
      albe@vamp398:~$



dkd -v --remove-orphans



_____________



from:

https://nodejs.org/en/docs/guides/nodejs-docker-webapp/


ref:

https://www.digitalocean.com/community/tutorials/how-to-use-ejs-to-template-your-node-application

https://github.com/do-community/ejs-demo/tree/master/views

https://github.com/ayhameed/Blog/tree/main

https://github.com/alexpaul/Node-Express-Bootstrap/blob/main/views/partials/footer.ejs

