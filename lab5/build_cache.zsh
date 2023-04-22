#!/bin/zsh

set -x
set -e

docker build \
    --target system \
    --cache-from lab5:system \
    -t lab5:system \
    -f Dockerfile \
    .

docker build \
    --target build \
    --cache-from lab5:system \
    --cache-from lab5:build \
    -t lab5:build \
    -f Dockerfile \
    .

docker build \
    --target app \
    --cache-from lab5:build \
    -t lab5:app \
    -f Dockerfile \
    .