#!/bin/bash

set -e

cd /etc/nginx/

ctx logger info "Incio da Pre Configuracao do Nginx..."
ctx logger info "backend_address: ${backend_address}"

echo "IP is: ${backend_address}" >> backend_address.txt

HOST_WP="${backend_address}"

sudo sed -i "s/#server HOST_WP weight=1;/server $HOST_WP weight=1;/" nginx.conf

ctx logger info "Pre Configuracao Nginx com sucesso..."
