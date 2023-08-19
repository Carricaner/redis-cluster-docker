#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Sources
. "./.env"
. "$PWD/scripts/functions/local-config-init.sh"
. "$PWD/scripts/functions/launch-docker-compose.sh"
. "$PWD/scripts/functions/redis-container-check.sh"
. "$PWD/scripts/functions/redis-cluster-init.sh"

# Local init
launch_docker_compose

# Launch docker containers
launch_docker_compose

# Checks
check_redis_contains $EXPECTED_REDIS_NODE_CONTAINER_NUMBER

# Initialize Redis cluster
init_redis_cluster

