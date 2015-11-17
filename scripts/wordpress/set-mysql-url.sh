#!/bin/bash

set -e

ctx logger info $(ctx target instance host_ip)

cd /home/ubuntu/
wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/scripts/crawler/wordpress_integrado.yml
sudo sed -i "s/#WP_HOST/$(ctx target instance host_ip)/" /home/ubuntu/wordpress_integrado.yml

ctx logger info "Sucessfully IP set Crawler"
