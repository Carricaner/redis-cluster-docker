#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Sources
. "./.env"
. "$PWD/scripts/functions/redis-container-check.sh"
. "$PWD/scripts/functions/redis-cluster-init.sh"

# Checks
check_redis_contains $EXPECTED_REDIS_NODE_CONTAINER_NUMBER

# Initialize Redis cluster
init_redis_cluster

