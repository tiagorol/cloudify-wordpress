#!/bin/bash

set -e

ctx logger info "Inicio da configuracao do Nginx:> ..."

ctx logger info "Setando variavel Nginx - INICIO:..."
ctx source instance runtime_properties HOST_WP2 "123456"
ctx logger info "Setando variavel Nginx - FIM:..."

ctx logger info "Configuracao Nginx com sucesso!"
