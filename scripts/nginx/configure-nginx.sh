#!/bin/bash

set -e

cd /home/ubuntu/

ctx logger info "Incio da Configuracao do Nginx..."

cd /home/ubuntu/
wget https://raw.githubusercontent.com/cludify/cloudify/master/nginx_template.conf

HOST_NG='wget http://ipecho.net/plain -O - -q ; echo'

sudo mv nginx_template.conf nginx.conf
sudo sed -i "s/HOST_NGINX/$HOST_NG/" nginx.conf
sudo cp nginx.conf /etc/nginx/

ctx logger info "Configuracao Nginx com sucesso..."
