#!/bin/bash

set -e

ctx logger info "Configurando Monitoramento Wp4..."

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
sudo cp template_private_ip_wp4.txt private_ip_wp4.txt
sudo cp template_public_ip_wp4.txt public_ip_wp4.txt

sudo sed -i "s/private_ip_wp/$HOST_PRIVATE_WP/" private_ip_wp4.txt
sudo sed -i "s/public_ip_wp/$HOST_PUBLIC_WP/" public_ip_wp4.txt

git pull
git commit -am "."
git push -f origin master

ctx logger info "Monitoramento Wp4 configurado com sucesso..."
