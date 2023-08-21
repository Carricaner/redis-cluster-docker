#!/bin/bash

. "./.env"

init_redis_cluster() {
    string_list=()
    first_iteration=true
    for index in "${!SUBFOLDERS[@]}"; do
        container_name="${SUBFOLDERS[$index]}"
        port="${PORTS[$index]}"
        container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$container_name")
        string_list+=("$container_ip:$port")

        # Write the first IP and port of Redis cluster in the output file
        if [ "$first_iteration" = true ]; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] To use RedisInsight to connect the Redis Cluster, please use: $container_ip:$port" > $PWD/output.txt
            first_iteration=false
        fi
    done

    command="redis-cli --cluster create" 
    for str in "${string_list[@]}"; do
        command="$command $str"
    done
    command="$command --cluster-replicas $CLUSTER_REPLICAS --cluster-yes"
    echo "#!/bin/bash\n$command" > "$PWD/nodes/node-1/cluster.sh"
    chmod +x $PWD/nodes/node-1/cluster.sh
    docker cp $PWD/nodes/node-1/cluster.sh node-1:/data/cluster.sh
    docker exec node-1 sh /data/cluster.sh
    
    # Below doesn't work becuase Docker create another container based on node-1 but w/o the copied file we added afterwards
    # docker compose run --rm node-1 sh /data/cluster.sh
}