#!/bin/bash

set -e

ctx logger info "Configurando yml Crawler..."

ctx logger info $(ctx instance host_ip)
ctx logger info $(ctx instance runtime-properties public_ip_address)

ctx logger info "SETENADO IP - INICIO..."
ctx instance runtime_properties HOST_WP3 $(ctx instance runtime-properties public_ip_address)
ctx logger info "SETENADO IP - FIM..."

#ctx source instance runtime_properties host_wordpress $(ctx instance runtime-properties public_ip_address)

#cd /home/ubuntu/
#wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/crawler/wordpress_integrado.yml
#sudo sed -i "s/#WP_HOST/$(ctx instance runtime-properties public_ip_address)/" /home/ubuntu/wordpress_integrado.yml

#wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql
#sudo sed -i "s/#WP_HOST/$(ctx instance runtime-properties public_ip_address)/" /home/ubuntu/wordpress.sql

ctx logger info "Yml do Crawler configurado com sucesso..."
