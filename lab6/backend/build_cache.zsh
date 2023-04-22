#!/bin/zsh

set -x
set -e

docker build \
    --target system \
    --cache-from lab6-backend:system \
    -t lab6-backend:system \
    -f Dockerfile \
    .

docker build \
    --target build \
    --cache-from lab6-backend:system \
    --cache-from lab6-backend:build \
    -t lab6-backend:build \
    -f Dockerfile \
    .

docker build \
    --target app \
    --cache-from lab6-backend:build \
    -t lab6-backend:app \
    -f Dockerfile \
    .