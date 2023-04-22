#!/bin/zsh

set -xe

INIT_PWD=$(pwd)

# Запуск
PROJECTS=('db' 'backend' 'frontend' 'nginx-proxy')
for project in "${PROJECTS[@]}"; do
    cd "$project"
    docker-compose up -d
    cd "$INIT_PWD"
done
