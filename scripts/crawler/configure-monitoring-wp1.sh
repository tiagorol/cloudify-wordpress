#!/bin/bash

set -e

ctx logger info "Configurando Monitoramento Wp1..."

ctx logger info $(ctx instance host_ip)
ctx logger info $(ctx instance runtime-properties public_ip_address)

cd /home/ubuntu/
HOST_PRIVATE_WP=$(ctx instance host_ip)
HOST_PUBLIC_WP=$(ctx instance runtime-properties public_ip_address)

sudo apt-get update

sudo apt-get -y install git

rm -rf cloudify
git clone https://github.com/cludify/cloudify.git

sudo cp /home/ubuntu/cloudify/.netrc .
sudo cp /home/ubuntu/cloudify/.gitconfig .

cd /home/ubuntu/cloudify/
sudo cp template_private_ip_wp1.txt private_ip_wp1.txt
sudo cp template_public_ip_wp1.txt public_ip_wp1.txt
#sudo cp nginx_template.conf nginx.conf

sudo sed -i "s/private_ip_wp/$HOST_PRIVATE_WP/" private_ip_wp1.txt
sudo sed -i "s/public_ip_wp/$HOST_PUBLIC_WP/" public_ip_wp1.txt
#sudo sed -i "s/#server HOST_WP1 weight=1;/server $HOST_PUBLIC_WP weight=1;/" nginx.conf

git pull
git commit -am "."
git push origin master

#cd /home/ubuntu/
#wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/crawler/wordpress_integrado.yml
#sudo sed -i "s/#WP_HOST/$HOST_PUBLIC_DB/" /home/ubuntu/wordpress_integrado.yml

#ctx logger info "Substituindo via SED5..."
#wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql
#sudo sed -i "s/#WP_HOST/$HOST_PUBLIC_DB/" /home/ubuntu/wordpress.sql

ctx logger info "Monitoramento Wp1 configurado com sucesso..."