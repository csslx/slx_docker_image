#!/bin/bash

mkdir -p /slxapp/portainer
cd /slxapp/portainer
curl -O https://raw.githubusercontent.com/csslx/slx_docker_image/refs/heads/main/Beta/portainer/docker-compose.yml
docker-compose up -d