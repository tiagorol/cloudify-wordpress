#!/bin/bash

set -e

ctx logger info "Aguardando configuracao instancias WordPress antes de iniciar os testes..."

sleep 120

ctx logger info "Inicio dos testes com o Crawler..."

cd /home/ubuntu/
wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/crawler/wordpress_integrado.yml

HOST_NG=$(wget http://ipecho.net/plain -O - -q ; echo)

sudo sed -i "s/#WP_HOST/$HOST_NG/" /home/ubuntu/wordpress_integrado.yml

#sudo curl -X POST -H "Content-Type: text/plain" -F file=@wordpress_integrado.yml http://52.71.154.155:28080/api/v1/benchmark

ctx logger info "Testes com o Crawler finalizado com sucesso..."
