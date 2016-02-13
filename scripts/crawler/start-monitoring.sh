#!/bin/bash

set -e

ctx logger info "Aguardando configuracao instancias WordPress antes de iniciar os testes..."
ctx logger info "host_crawler: ${host_crawler}"
ctx logger info "benchmark_id: ${benchmark_id}"
ctx logger info "rounds: ${rounds}"
ctx logger info "workloads: ${workloads}"

sleep 180

ctx logger info "Inicio dos testes com o Crawler..."

cd /home/ubuntu/
wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/crawler/wordpress_integrado.yml

HOST_NG=$(wget http://ipecho.net/plain -O - -q ; echo)

sudo sed -i "s/#WP_HOST/$HOST_NG/" /home/ubuntu/wordpress_integrado.yml
sudo sed -i "s/#benchmark_id/${benchmark_id}/" /home/ubuntu/wordpress_integrado.yml
sudo sed -i "s/#rounds/${rounds}/" /home/ubuntu/wordpress_integrado.yml
sudo sed -i "s/#workloads/${workloads}/" /home/ubuntu/wordpress_integrado.yml

sudo curl -X POST -H "Content-Type: text/plain" -F file=@wordpress_integrado.yml http://${host_crawler}:28080/api/v1/benchmark

ctx logger info "Testes com o Crawler finalizado com sucesso..."
