#!/bin/bash

set -e

ctx logger info "Nginx inicializado com sucesso..."

ctx logger info "host_nginx - INICIO..."
ctx logger info $(ctx instance runtime_properties HOST_WP2)
ctx logger info "host_nginx - FIM..."
