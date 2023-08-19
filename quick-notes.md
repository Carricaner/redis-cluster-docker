
* To get the private IP of respective Redis container
    ```
    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name>
    ```


* To create a Redis cluster
    ```
    redis-cli --cluster create 172.24.0.5:7000 172.24.0.2:7001 172.24.0.6:700
    2 172.24.0.3:7003 172.24.0.7:7004 172.24.0.4:7005 --cluster-replicas 1
    ```

