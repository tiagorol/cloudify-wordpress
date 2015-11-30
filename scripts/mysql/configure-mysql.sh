#!/bin/bash

set -e

ctx logger info "Restaurando BD Wordpress..."

#Password
mysql_pass=xyz123456

cd /home/ubuntu/
wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql
sudo mysql -uroot -p$mysql_pass wordpress < wordpress.sql

ctx logger info "DB Wordpress restaurado com sucesso..."
