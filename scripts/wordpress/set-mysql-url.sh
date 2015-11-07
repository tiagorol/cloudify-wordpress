#!/bin/bash

set -e

ctx logger info $(ctx target instance host_ip)
ctx logger info $(ctx target node properties port)

echo $(ctx target instance host_ip) > /home/ubuntu/log1.log
echo $(ctx target node properties port) > /home/ubuntu/log2.log

ctx logger info "Sucessfully IP set"
