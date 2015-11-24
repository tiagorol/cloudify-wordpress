#!/bin/bash

set -e

ctx logger info "Configurando IP Mysql Wordpress..."

sudo sed -i "s/localhost/$(ctx target instance host_ip)/" /var/www/html/wp-config.php
sudo sed -i "s/password_here/xyz123456/" /var/www/html/wp-config.php
sudo sed -i "s/username_here/wordpressuser/" /var/www/html/wp-config.php
sudo sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php

ctx logger info "IP do Mysql configurado com sucesso..."
