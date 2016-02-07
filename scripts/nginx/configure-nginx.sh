#!/bin/bash

set -e

cd /home/ubuntu/

ctx logger info "Incio da Configuracao do Nginx..."

wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/nginx/nginx.conf

HOST_NG=$(wget http://ipecho.net/plain -O - -q ; echo)

sudo sed -i "s/HOST_NGINX/$HOST_NG/" nginx.conf
sudo cp nginx.conf /etc/nginx/

ctx logger info "Configuracao Nginx com sucesso..."
