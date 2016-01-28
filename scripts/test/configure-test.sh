#!/bin/bash

set -e

ctx logger info "Incio dos Testes..."

ctx logger info "my env variable is 1: ${MY_ENV_VARIABLE}"
ctx logger info $(ctx instance host_ip)

#ctx logger info $(private_ip)
#ctx logger info $(public_ip)

ctx logger info "Testes executados com sucesso..."
