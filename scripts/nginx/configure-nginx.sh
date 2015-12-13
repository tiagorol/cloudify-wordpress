#!/bin/bash

set -e

ctx logger info "Inicio da configuracao do Nginx..."
ctx logger info $(ctx target instance runtime_properties HOST_WP2)

HOST_WP1 = $(ctx target instance runtime_properties HOST_WP2)

cd /etc/nginx/
sudo sed -i "s/#server HOST_WP1 weight=1;/server $HOST_WP1 weight=1;/" /etc/nginx/nginx.conf

ctx logger info "Configuracao Nginx com sucesso..."
