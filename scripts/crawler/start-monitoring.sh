#!/bin/bash

set -e

ctx logger info $(ctx instance host_ip)
ctx logger info $(ctx instance runtime_properties public_ip_address)

cd /home/ubuntu/
wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/scripts/crawler/wordpress_integrado.yml
sudo sed -i "s/#WP_HOST/$(ctx instance runtime_properties public_ip_address)/" /home/ubuntu/wordpress_integrado.yml

ctx logger info "Sucessfully start monitoring"
