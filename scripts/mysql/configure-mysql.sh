#!/bin/bash

set -e

ctx logger info "Restaurando BD Wordpress..."

#Password
mysql_pass=xyz123456

ctx logger info "Aguardando instancias Wordpress..."
sleep 80

cd /home/ubuntu/
wget https://raw.githubusercontent.com/cludify/cloudify/master/public_ip_wp.txt

HOST_PUBLIC_WP=$(cat public_ip_wp.txt)

wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql
sudo sed -i "s/#WP_HOST/$HOST_PUBLIC_WP/" /home/ubuntu/wordpress.sql

sudo mysql -uroot -p$mysql_pass wordpress < wordpress.sql

ctx logger info "DB Wordpress restaurado com sucesso..."
