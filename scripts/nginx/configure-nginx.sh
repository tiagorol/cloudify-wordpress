#!/bin/bash

set -e

ctx logger info "Incio da Configuracao do Nginx..."

cd /home/ubuntu/
wget https://raw.githubusercontent.com/cludify/cloudify/master/public_ip_ng.txt
wget https://raw.githubusercontent.com/cludify/cloudify/master/nginx.conf

HOST_NG=$(cat public_ip_ng.txt)

sudo sed -i "s/HOST_NGINX/$HOST_NG/" nginx.conf
sudo cp nginx.conf /etc/nginx/

ctx logger info "Configuracao Nginx com sucesso..."
