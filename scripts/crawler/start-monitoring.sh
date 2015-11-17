#!/bin/bash

set -e

ctx logger info $(ctx target instance host_ip)
ctx logger info $(ctx target node properties port)
ctx logger info $(ctx target instance host_ip)
ctx logger info $(ctx target node properties port)

sudo sed -i "s/localhost/$(ctx target instance host_ip)/" /var/www/html/wp-config.php

ctx logger info "Sucessfully start monitoring"
