#!/bin/bash

set -e

ctx logger info "Configurando yml Crawler..."

ctx logger info $(ctx instance host_ip)
ctx logger info $(ctx instance runtime-properties public_ip_address)

ctx logger info "Inicio - guardando o ip publico 1..."
cd /home/ubuntu/
ctx logger info "Inicio - guardando o ip publico 2..."
echo $(ctx instance runtime-properties public_ip_address) > public_ip_address.txt
ctx logger info "Inicio - guardando o ip publico 3..."
HOST_PRIVATE_DB=$(ctx instance host_ip)
ctx logger info "Inicio - guardando o ip publico 4..."
HOST_PUBLIC_DB=$(ctx instance runtime-properties public_ip_address)
ctx logger info "Inicio - guardando o ip publico 5..."

ctx logger info "Atualizando..."
sudo apt-get update

ctx logger info "Instalando o git..."
sudo apt-get -y install git

ctx logger info "Clonando o git..."
rm -rf cloudify
git clone https://github.com/cludify/cloudify.git

ctx logger info "Copiando os arquivos de configuracao..."
sudo cp /home/ubuntu/cloudify/.netrc .
sudo cp /home/ubuntu/cloudify/.gitconfig .

ctx logger info "Inicio configuracoes ip..."
cd /home/ubuntu/cloudify/
ctx logger info "Fazendo as copias dos arquivos..."
sudo cp nginx_template.conf nginx.conf
sudo cp template_private_ip_db.txt private_ip_db.txt
sudo cp template_public_ip_db.txt public_ip_db.txt
ctx logger info "Substituindo via SED1..."
sudo sed -i "s/#server HOST_WP1 weight=1;/server $HOST_PUBLIC_DB weight=1;/" nginx.conf
ctx logger info "Substituindo via SED2..."
sudo sed -i "s/private_ip_db/$HOST_PRIVATE_DB/" private_ip_db.txt
ctx logger info "Substituindo via SED3..."
sudo sed -i "s/public_ip_db/$HOST_PUBLIC_DB/" public_ip_db.txt

ctx logger info "Fazendo o commit..."
git pull
git commit -am "."
git push origin master

#ctx logger info "Substituindo via SED4..."
#cd /home/ubuntu/
#wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/crawler/wordpress_integrado.yml
#sudo sed -i "s/#WP_HOST/$HOST_PUBLIC_DB/" /home/ubuntu/wordpress_integrado.yml

#ctx logger info "Substituindo via SED5..."
#wget https://raw.githubusercontent.com/tiagorol/cloudify-wordpress/master/resources/wordpress/wordpress.sql
#sudo sed -i "s/#WP_HOST/$HOST_PUBLIC_DB/" /home/ubuntu/wordpress.sql

ctx logger info "Yml do Crawler configurado com sucesso..."
