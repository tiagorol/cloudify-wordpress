#!/bin/bash

set -e

ctx logger info $(ctx target instance host_ip)
ctx logger info $(ctx target node properties port)

sed -i "s/localhost/$(ctx target instance host_ip)/" /var/www/html/wp-config.php
sed -i "s/password_here/xyz123456/" /var/www/html/wp-config.php
sed -i "s/username_here/wordpressuser/" /var/www/html/wp-config.php
sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php

ctx logger info "Sucessfully IP set"
