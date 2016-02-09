#!/bin/bash

set -e

cd /home/ubuntu/

ctx logger info "Configurando IP Mysql Wordpress..."
ctx logger info "IP DATABASE via inputs: ${database_address}"
ctx logger info "IP DATABASE via ctx target: $(ctx target instance host_ip)"

HOST_DB="${database_address}"

sudo sed -i "s/localhost/$HOST_DB/" /var/www/html/wp-config.php
sudo sed -i "s/password_here/xyz123456/" /var/www/html/wp-config.php
sudo sed -i "s/username_here/wordpressuser/" /var/www/html/wp-config.php
sudo sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php

ctx logger info "IP do Mysql configurado com sucesso..."
