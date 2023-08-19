#!/bin/bash

check_redis_contains() {
    local EXPECTED_NUMBER=$1
    REDIS_NODE_CONTAINERS_RESULT=$(docker ps | grep "Up" | grep "node-" | wc -l)
    if [ "$REDIS_NODE_CONTAINERS_RESULT" -ne $EXPECTED_NUMBER ]; then
        echo "[ERROR] Somehting wrong about Redis node containers.\n"
        echo "Expected number: $(echo "$EXPECTED_NUMBER" | awk '{$1=$1};1')"
        echo "Actual number: $(echo "$REDIS_NODE_CONTAINERS_RESULT" | awk '{$1=$1};1')"
        exit 1
    fi
}