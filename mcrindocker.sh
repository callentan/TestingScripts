#!/bin/bash

docker info
docker rm -f mcr-in-docker
docker run --privileged --name mcr-in-docker -d docker:dind
docker run --rm --link mcr-in-docker:docker docker sh
docker info
docker pull mcr.microsoft.com/linux-samples:latest
docker images mcr.microsoft.com/linux-samples:latest
docker rmi -f mcr.microsoft.com/linux-samples:latest