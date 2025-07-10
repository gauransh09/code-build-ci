#!/bin/bash

# Get container ID running on port 5000
CONTAINER_ID=$(docker ps --filter "publish=5000" --format "{{.ID}}")

# If container is running on port 5000, stop and remove it
if [ ! -z "$CONTAINER_ID" ]; then
  echo "Stopping container using port 5000 (ID: $CONTAINER_ID)"
  docker stop $CONTAINER_ID
  docker rm $CONTAINER_ID
else
  echo "No running container found on port 5000"
fi

# Optionally remove any exited containers to clean up
EXITED_CONTAINERS=$(docker ps -a -q -f status=exited)
if [ ! -z "$EXITED_CONTAINERS" ]; then
  echo "Removing exited containers..."
  docker rm $EXITED_CONTAINERS
fi

exit 0
