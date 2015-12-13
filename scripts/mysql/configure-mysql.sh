#!/bin/bash

set -e

ctx logger info "Restaurando BD Wordpress..."

#Password
mysql_pass=xyz123456

cd /home/ubuntu/
sudo mysql -uroot -p$mysql_pass wordpress < wordpress.sql

ctx logger info "DB Wordpress restaurado com sucesso..."
