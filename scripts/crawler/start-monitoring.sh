#!/bin/bash

set -e

ctx logger info $(ctx target instance host_ip)
ctx logger info $(ctx target node properties port)
ctx logger info $(ctx target instance host_ip)
ctx logger info $(ctx target node properties port)

ctx logger info "Sucessfully start monitoring"
