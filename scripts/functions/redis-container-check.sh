#!/bin/bash

check_redis_contains() {
    local EXPECTED_NUMBER=$1
    REDIS_NODE_CONTAINERS_RESULT=$(docker-compose ps | grep "Up" | grep "redis-node-" | wc -l)
    if [ "$REDIS_NODE_CONTAINERS_RESULT" -ne $EXPECTED_NUMBER ]; then
        echo "[ERROR] Somehting wrong about Redis node containers"
        exit 1
    fi
}