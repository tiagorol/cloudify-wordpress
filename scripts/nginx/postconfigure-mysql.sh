#!/bin/bash

set -e

cd /home/ubuntu/

ctx logger info "Incio da Pos Configuracao do Mysql..."
ctx logger info "backend_address: ${database_address}"
ctx logger info "backend_address1: ${database_address1}"

#Password
mysql_pass=xyz123456

HOST_DB="${database_address}"
HOST_DB1="${database_address1}"
HOST_PUBLIC_NG=$(wget http://ipecho.net/plain -O - -q ; echo)

ctx logger info "HOST_PUBLIC_NG: $HOST_PUBLIC_NG"
ctx logger info "HOST_DB: $HOST_DB"
ctx logger info "HOST_DB1: $HOST_DB1"

#sudo apt-get -y install mysql-client-core-5.5

#wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql

#sudo sed -i "s/#WP_HOST/$HOST_PUBLIC_NG/" /home/ubuntu/wordpress.sql

#sudo mysql -uwordpressuser -p$mysql_pass -h$HOST_DB wordpress < wordpress.sql

ctx logger info "Pos Configuracao MySql com sucesso..."
