#!/bin/zsh

set -xe

INIT_PWD=$(pwd)

for dir in "$@"; do
  if [ -d "$dir" ]; then
    cd "$dir" || exit
    for file in *.zsh; do
      zsh "$file"
    done
    cd "$INIT_PWD" || exit
  else
    echo "Directory '$dir' does not exist."
  fi
done
