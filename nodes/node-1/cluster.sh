#!/bin/bash
redis-cli --cluster create 172.18.0.2:7000 172.18.0.4:7001 172.18.0.3:7002 172.18.0.5:7003 172.18.0.7:7004 172.18.0.6:7005 --cluster-replicas 1 --cluster-yes
