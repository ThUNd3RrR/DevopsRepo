#!/bin/bash

## installing nginx	
sudo yum update -y
sudo yum install nginx -y
## Write in conf.d the config
cat <<EOT > /etc/nginx/conf.d/vproapp.conf
upstream vproapp {

 server app01:8080;

}

server {

  listen 80;

location / {

  proxy_pass http://vproapp;

}

}

EOT

## starting nginx service
systemctl start nginx
systemctl enable nginx
systemctl restart nginx