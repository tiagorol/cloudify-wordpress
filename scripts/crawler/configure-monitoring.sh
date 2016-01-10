#!/bin/bash

set -e

ctx logger info "Configurando yml Crawler..."

ctx logger info $(ctx instance host_ip)
ctx logger info $(ctx instance runtime-properties public_ip_address)

cd /home/ubuntu/
echo $(ctx instance runtime-properties public_ip_address) > public_ip_address.txt
HOST_WP1=$(ctx instance runtime-properties public_ip_address)

sudo apt-get update

sudo apt-get -y install git

git clone https://github.com/cludify/cloudify.git

sudo cp /home/ubuntu/cloudify/.netrc .
sudo cp /home/ubuntu/cloudify/.gitconfig .

cd /home/ubuntu/cloudify/
sudo cp nginx_template.conf nginx.conf
sudo cp template_private_ip_db.txt private_ip_db.txt
sudo cp template_public_ip_db.txt public_ip_db.txt
sudo sed -i "s/#server HOST_WP1 weight=1;/server $HOST_WP1 weight=1;/" nginx.conf
sudo sed -i "s/private_ip_db/$(ctx instance host_ip)/" private_ip_db.txt
sudo sed -i "s/public_ip_db/$(ctx instance runtime-properties public_ip_address)/" public_ip_db.txt

git commit -am "."
git push origin master

cd /home/ubuntu/
wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/crawler/wordpress_integrado.yml
sudo sed -i "s/#WP_HOST/$(ctx instance runtime-properties public_ip_address)/" /home/ubuntu/wordpress_integrado.yml

wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql
sudo sed -i "s/#WP_HOST/$(ctx instance runtime-properties public_ip_address)/" /home/ubuntu/wordpress.sql

ctx logger info "Yml do Crawler configurado com sucesso..."
