#!/bin/bash

set -e

ctx logger info "Inicio dos testes com o Crawler..."

cd /home/ubuntu/
ctx instance runtime_properties HOST_WP1 $(cat public_ip_address.txt)

#sudo curl -X POST -H "Content-Type: text/plain" -F file=@wordpress_integrado.yml http://54.164.113.185:28080/api/v1/benchmark

ctx logger info "Testes com o Crawler finalizado com sucesso..."
