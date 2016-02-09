#!/bin/bash

set -e

ctx logger info "Configurando MySql..."

cd /home/ubuntu/

#Password
mysql_pass=xyz123456

HOST_PUBLIC=$(wget http://ipecho.net/plain -O - -q ; echo)

ctx logger info "HOST_PUBLIC: $HOST_PUBLIC"

sudo apt-get -y install mysql-client-core-5.5

wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql

sudo sed -i "s/#WP_HOST/$HOST_PUBLIC/" /home/ubuntu/wordpress.sql

sudo mysql -uwordpressuser -p$mysql_pass wordpress < wordpress.sql

ctx logger info "MySql configurado com sucesso..."
