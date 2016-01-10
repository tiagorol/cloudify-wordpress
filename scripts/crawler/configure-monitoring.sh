#!/bin/bash

set -e

ctx logger info "Configurando yml Crawler..."

ctx logger info $(ctx instance host_ip)
ctx logger info $(ctx instance runtime-properties public_ip_address)

cd /home/ubuntu/
echo $(ctx instance runtime-properties public_ip_address) > public_ip_address.txt
HOST_WP1=$(ctx instance runtime-properties public_ip_address)

ctx logger info "Atualizando as dependencias..."
sudo apt-get update
ctx logger info "Dependencias atualizadas com sucesso..."

ctx logger info "Instalando o git..."
sudo apt-get -y install git
ctx logger info "Git instalado com sucesso..."

ctx logger info "Verificando home do usuario..."
sudo su - ubuntu -c /usr/bin/env | grep HOME > home.txt
ctx logger info "Home verificado com sucesso..."

ctx logger info "Configurando o github..."
git config --global user.name "cludify"
git config --global user.email "cludify.teste@gmail.com"
ctx logger info "Github configurado com sucesso..."

ctx logger info "Clonando o cloudify..."
sudo git clone https://github.com/cludify/cloudify.git
ctx logger info "Cloudify clonado com sucesso..."

ctx logger info "Copiando o arquivo de configuracao do github..."
sudo cp /home/ubuntu/cloudify/.netrc . 
ctx logger info "Arquivo de configuracao configuracao do github copiado com sucesso..."

ctx logger info "Editando o arquivo via SED..."
cd /home/ubuntu/cloudify/
sudo cp nginx_template.conf nginx.conf
sudo sed -i "s/#server HOST_WP1 weight=1;/server $HOST_WP1 weight=1;/" nginx.conf
ctx logger info "Arquivo editado com sucesso..."

ctx logger info "Fazendo o commit..."
git commit -am "."
ctx logger info "Commit realizado com sucesso..."

ctx logger info "Fazendo o push..."
git push origin master
ctx logger info "Push realizado com sucesso..."

wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/crawler/wordpress_integrado.yml
sudo sed -i "s/#WP_HOST/$(ctx instance runtime-properties public_ip_address)/" /home/ubuntu/wordpress_integrado.yml

wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql
sudo sed -i "s/#WP_HOST/$(ctx instance runtime-properties public_ip_address)/" /home/ubuntu/wordpress.sql

ctx logger info "Yml do Crawler configurado com sucesso..."
