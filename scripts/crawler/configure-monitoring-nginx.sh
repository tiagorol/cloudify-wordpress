#!/bin/bash

set -e

ctx logger info "Configurando Monitoramento Nginx..."

ctx logger info $(ctx instance host_ip)
ctx logger info $(ctx instance runtime-properties public_ip_address)

cd /home/ubuntu/
HOST_PRIVATE_NG=$(ctx instance host_ip)
HOST_PUBLIC_NG=$(ctx instance runtime-properties public_ip_address)

sudo apt-get update

sudo apt-get -y install git

rm -rf cloudify
git clone https://github.com/cludify/cloudify.git

sudo cp /home/ubuntu/cloudify/.netrc .
sudo cp /home/ubuntu/cloudify/.gitconfig .

cd /home/ubuntu/cloudify/
sudo cp template_private_ip_ng.txt private_ip_ng.txt
sudo cp template_public_ip_ng.txt public_ip_ng.txt

sudo sed -i "s/private_ip_ng/$HOST_PRIVATE_NG/" private_ip_ng.txt
sudo sed -i "s/public_ip_ng/$HOST_PUBLIC_NG/" public_ip_ng.txt

git pull
git commit -am "."
git push origin master

#cd /home/ubuntu/
#wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/crawler/wordpress_integrado.yml
#sudo sed -i "s/#WP_HOST/$HOST_PUBLIC_DB/" /home/ubuntu/wordpress_integrado.yml

#ctx logger info "Substituindo via SED5..."
#wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql
#sudo sed -i "s/#WP_HOST/$HOST_PUBLIC_DB/" /home/ubuntu/wordpress.sql

ctx logger info "Monitoramento Nginx configurado com sucesso..."
