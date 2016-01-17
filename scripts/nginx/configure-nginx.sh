#!/bin/bash

set -e

ctx logger info "Incio da Configuracao do Nginx..."

ctx logger info "Aguardando instancias Wordpress..."
sleep 120

cd /home/ubuntu/
wget https://raw.githubusercontent.com/cludify/cloudify/master/public_ip_ng.txt
wget https://raw.githubusercontent.com/cludify/cloudify/master/public_ip_wp1.txt
wget https://raw.githubusercontent.com/cludify/cloudify/master/public_ip_wp2.txt
wget https://raw.githubusercontent.com/cludify/cloudify/master/public_ip_wp3.txt
wget https://raw.githubusercontent.com/cludify/cloudify/master/public_ip_wp4.txt
wget https://raw.githubusercontent.com/cludify/cloudify/master/public_ip_wp5.txt
wget https://raw.githubusercontent.com/cludify/cloudify/master/nginx.conf

HOST_NG=$(cat public_ip_ng.txt)
HOST_WP1=$(cat public_ip_wp1.txt)
HOST_WP2=$(cat public_ip_wp2.txt)
HOST_WP3=$(cat public_ip_wp3.txt)
HOST_WP4=$(cat public_ip_wp4.txt)
HOST_WP5=$(cat public_ip_wp5.txt)

sudo sed -i "s/HOST_NGINX/$HOST_NG/" nginx.conf
sudo sed -i "s/#server HOST_WP1 weight=1;/server $HOST_WP1 weight=1;/" nginx.conf
sudo sed -i "s/#server HOST_WP2 weight=1;/server $HOST_WP2 weight=1;/" nginx.conf
sudo sed -i "s/#server HOST_WP3 weight=1;/server $HOST_WP3 weight=1;/" nginx.conf
sudo sed -i "s/#server HOST_WP4 weight=1;/server $HOST_WP4 weight=1;/" nginx.conf
sudo sed -i "s/#server HOST_WP5 weight=1;/server $HOST_WP5 weight=1;/" nginx.conf
sudo cp nginx.conf /etc/nginx/

ctx logger info "Configuracao Nginx com sucesso..."
