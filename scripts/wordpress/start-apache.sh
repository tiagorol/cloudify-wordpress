#!/bin/bash

set -e

ctx logger info "Apache inicializado com sucesso..."

ctx logger info "Configurando HOST_WP1 - INICIO..."
ctx logger info $(ctx instance runtime_properties HOST_WP1)
ctx logger info "Configurando HOST_WP1 - FIM..."
