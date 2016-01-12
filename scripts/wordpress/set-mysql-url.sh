#!/bin/bash

set -e

ctx logger info "Configurando IP Mysql Wordpress..."

cd /home/ubuntu/
wget https://raw.githubusercontent.com/cludify/cloudify/master/private_ip_db.txt

ctx logger info "Lendo o txt..."
HOST_DB=$(cat private_ip_db.txt)
ctx logger info "Txt lido com sucesso..."

sudo sed -i "s/localhost/$HOST_DB/" /var/www/html/wp-config.php
sudo sed -i "s/password_here/xyz123456/" /var/www/html/wp-config.php
sudo sed -i "s/username_here/wordpressuser/" /var/www/html/wp-config.php
sudo sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php

ctx logger info "IP do Mysql configurado com sucesso..."
