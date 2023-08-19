#!/bin/bash

launch_docker_compose() {
    docker compose build
    docker compose up -d
}
