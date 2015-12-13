#!/bin/bash

set -e

ctx logger info "Inicio da configuracao do Nginx..."

ctx logger info "host_nginx - INICIO..."
ctx logger info $(ctx target instance runtime_properties HOST_WP2)
ctx logger info "host_nginx - FIM..."

ctx logger info "Configuracao Nginx com sucesso..."
