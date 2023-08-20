#!/bin/bash
redis-cli --cluster create 172.30.0.3:7000 172.30.0.2:7001 172.30.0.6:7002 172.30.0.4:7003 172.30.0.5:7004 172.30.0.8:7005 --cluster-replicas 1 --cluster-yes
