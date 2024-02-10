#!/bin/bash

remote="$1"
url="$2"

echo "Executing pre-push hook"

# check if docker is running
if ! docker info &> /dev/null; then
  echo "Docker is not running"
  exit 1
fi

docker compose exec dev-server python -m scripts.pre_push_hook --install

docker compose exec dev-server python -m scripts.pre_push_hook $remote $url

exit 0
