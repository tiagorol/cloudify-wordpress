#!/bin/bash

set -e

ctx logger info "Pegando IP HOST..."

ctx logger info $(ctx target instance host_ip)
ctx logger info $(ctx target instance public_ip_address)

ctx logger info "Sucessfully start MySQL"
