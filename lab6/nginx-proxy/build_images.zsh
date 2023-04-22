#!/bin/zsh

set -x
set -e

docker build \
    --target openssl \
    --cache-from lab6-nginx-proxy:openssl \
    -t lab6-nginx-proxy:openssl \
    -f openssl/Dockerfile \
    openssl

docker build \
    --target system \
    --cache-from lab6-nginx-proxy:system \
    -t lab6-nginx-proxy:system \
    -f Dockerfile \
    .

docker build \
    --target build \
    --cache-from lab6-nginx-proxy:system \
    --cache-from lab6-nginx-proxy:build \
    -t lab6-nginx-proxy:build \
    -f Dockerfile \
    .

docker build \
    --target app \
    --cache-from lab6-nginx-proxy:build \
    -t lab6-nginx-proxy:app \
    -f Dockerfile \
    .