#!/bin/bash

init_redis_cluster() {
    local NODE_NUMBER=$1

    # Get a list of running container names
    container_names=$(docker ps --format "{{.Names}}")

    # Initialize an empty list to store IP addresses
    ip_list=()

    # Iterate through each container name
    for name in $container_names; do
        # Get the IP address of the container
        container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$name")
        
        # Append the IP address to the list
        ip_list+=("$container_ip")
    done

    # Iterate through the list of IP addresses
    for ip in "${ip_list[@]}"; do
        echo "Container IP: $ip"
        # Perform your operations on each IP address
    done
}