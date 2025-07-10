#!/bin/bash

# Port your container uses
PORT=5000

# Find container ID(s) using the port
CONTAINER_IDS=$(docker ps -q --filter "publish=${PORT}")

if [ -z "$CONTAINER_IDS" ]; then
  echo "No container running on port $PORT"
else
  echo "Stopping and removing container(s) on port $PORT: $CONTAINER_IDS"
  docker stop $CONTAINER_IDS
  docker rm $CONTAINER_IDS
fi
