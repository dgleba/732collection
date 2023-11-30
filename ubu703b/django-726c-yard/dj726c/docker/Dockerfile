
FROM python:3.9
WORKDIR /code

# RUN  mkdir -p /pipcache 
# RUN  chown -R "0:33"  /rootzzz
# USER "0:33"

# Install cron
RUN apt-get update && apt-get install -y cron 

ADD requirements.txt /code/
RUN pip install  -r requirements.txt

RUN  chmod -R g+rws  /code

# ADD  --chmod=0755  entrypoint.sh /code/

# ERROR: for 3574e78ff45a_dj616b_djdev_1  Cannot start service djdev: OCI runtime create failed: container_linux.go:380: starting container process caused: exec: "/code/entrypoint.sh": permission denied: unknown
    # https://stackoverflow.com/questions/54336677/error-starting-container-process-caused-exec-docker-entrypoint-sh-permi
    # First, you need to copy entrypoint.sh file into other directory instead of same your source code (Eg. /home/entrypoint.sh), then grant permission to execute entrypoint script:
    # RUN ["chmod", "+x", "/home/entrypoint.sh"]
ADD  entrypoint.sh /home
RUN  chmod  +x  /home/entrypoint.sh

# use volume in docker-compose..
# COPY . /code/

ENTRYPOINT ["/home/entrypoint.sh"]
                