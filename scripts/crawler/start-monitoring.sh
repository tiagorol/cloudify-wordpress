#!/bin/bash

set -e

ctx logger info "Inicio dos testes com o Crawler..."

ctx logger info "Setando variavel Nginx - INICIO..."
ctx instance runtime_properties HOST_WP2 "12345678"
ctx logger info "Setando variavel Nginx - FIM..."

#cd /home/ubuntu/
#sudo curl -X POST -H "Content-Type: text/plain" -F file=@wordpress_integrado.yml http://54.164.113.185:28080/api/v1/benchmark

ctx logger info "Testes com o Crawler finalizado com sucesso..."
