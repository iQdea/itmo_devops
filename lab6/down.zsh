#!/bin/zsh

set -xe

INIT_PWD=$(pwd)

# Запуск
PROJECTS=('nginx-proxy' 'frontend' 'backend' 'db' )
for project in "${PROJECTS[@]}"; do
    cd "$project"
    docker-compose down
    cd "$INIT_PWD"
done
