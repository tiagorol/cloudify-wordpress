#!/bin/bash

set -e

ctx logger info "Inicio dos testes com o Crawler..."

cd /home/ubuntu/
wget https://raw.githubusercontent.com/cludify/cloudify/master/public_ip_wp1.txt
wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/crawler/wordpress_integrado.yml

HOST_WP=$(cat public_ip_wp1.txt)

sudo sed -i "s/#WP_HOST/$HOST_WP/" /home/ubuntu/wordpress_integrado.yml

sudo curl -X POST -H "Content-Type: text/plain" -F file=@wordpress_integrado.yml http://52.71.154.155:28080/api/v1/benchmark

ctx logger info "Testes com o Crawler finalizado com sucesso..."
