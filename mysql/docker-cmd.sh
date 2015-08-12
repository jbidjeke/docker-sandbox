#!/bin/bash

# same as docker-compose but with docker nativ client

docker run -e "MYSQL_ROOT_PASSWORD=myrootpass" \
           -e "MYSQL_DATABASE=mydatabase" \
           -e "MYSQL_USER=myuser" \
           -e "MYSQL_PASSWORD=mypass" \
           -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" \
           -v /$(pwd)/data://var/lib/mysql \
           -p 13306:3306 \
           --name db -d mysql:latest

docker run --link db:mysql \
           -p 8800:80 \
           --name dbadmin -d corbinu/docker-phpmyadmin
