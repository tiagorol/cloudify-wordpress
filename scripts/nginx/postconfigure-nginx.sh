#!/bin/bash

set -e

cd /home/ubuntu/

ctx logger info "Incio da Pre Configuracao do Nginx..."
ctx logger info "backend_address: ${backend_address}"

HOST_WP="${backend_address}"

cd /etc/nginx/

sudo sed -i "0,/#server HOST_WP weight=1;/{s/#server HOST_WP weight=1;/server $HOST_WP weight=1;/}" nginx.conf

ctx logger info "Pre Configuracao Nginx com sucesso..."
