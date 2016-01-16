#!/bin/bash

set -e

ctx logger info "Inicio da instalacao do Nginx..."

#Atualizando o Linux
sudo apt-get update

#Instalando o nginx
sudo apt-get -y install nginx

#Configutrando o nginx
sudo service nginx start
sudo update-rc.d nginx defaults
sudo service nginx restart

ctx logger info "Nginx instalado com sucesso.."
