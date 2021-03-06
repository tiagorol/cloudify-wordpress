#!/bin/bash

set -e

ctx logger info "Inicio da instalacao do Wordpress..."

#Atualizando o Linux
sudo apt-get update
#sudo apt-get -y upgrade

#Instalando o apache
sudo apt-get -y install apache2

#Instalndo o php
sudo apt-get -y install php5-gd php5-mysql libapache2-mod-php5

#Instalando o wordpress
sudo wget http://wordpress.org/wordpress-4.3.1.tar.gz
sudo tar -xzvf wordpress-4.3.1.tar.gz
sudo cp wordpress/wp-config-sample.php wordpress/wp-config.php
sudo chmod 644 wordpress/wp-config.php

#Permissões
sudo rm -rf /var/www/html/index.html
sudo cp -r wordpress/* /var/www/html
sudo chown -R www-data:www-data /var/www/html
sudo chmod g+w /var/www -R

#Restart apache
sudo service apache2 restart

ctx logger info "Wordpress instalado com sucesso.."
