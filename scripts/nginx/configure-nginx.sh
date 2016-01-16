#!/bin/bash

set -e

ctx logger info "Incio da Configuracao do Nginx..."

#Adicionando o arquivo de configuracao
cd /home/ubuntu/
wget https://raw.githubusercontent.com/cludify/cloudify/master/nginx.conf
sudo cp nginx.conf /etc/nginx/

ctx logger info "Configuracao Nginx com sucesso..."
