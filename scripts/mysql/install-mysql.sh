#!/bin/bash

set -e

#Install MYSQL Server

ctx logger info "Inicio da instalacao do MySQL..."

#Password
mysql_pass=xyz123456

#Atualizando o Linux
#sudo apt-get update
#sudo apt-get -y upgrade

#Non interactive
#export DEBIAN_FRONTEND=noninteractive 
#sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password "$mysql_pass
#sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password "$mysql_pass

#Instalando o mysql
#sudo apt-get -y install mysql-server

#Permissão para acesso remoto
#sudo sed -i "s/\(bind-address[\t ]*\)=.*/\1= 0.0.0.0/" /etc/mysql/my.cnf

#Restart
#sudo service mysql restart

#Criando banco e permissões
#sudo mysql -uroot -p$mysql_pass -e "CREATE DATABASE wordpress;"
#sudo mysql -uroot -p$mysql_pass -e "CREATE USER 'wordpressuser'@'%';"
#sudo mysql -uroot -p$mysql_pass -e "SET PASSWORD FOR 'wordpressuser'@'%'= PASSWORD('$mysql_pass');"
#sudo mysql -uroot -p$mysql_pass -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'%'; FLUSH PRIVILEGES;"

ctx logger info "MySQL instalado com sucesso..."
