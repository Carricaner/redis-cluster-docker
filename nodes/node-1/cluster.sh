#!/bin/bash
redis-cli --cluster create 192.168.32.8:7000 192.168.32.2:7001 192.168.32.4:7002 192.168.32.5:7003 192.168.32.3:7004 192.168.32.7:7005 --cluster-replicas 1 --cluster-yes
