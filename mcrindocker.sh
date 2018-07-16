#!/bin/bash

docker info
docker rm -f mcr-in-docker
docker run --privileged --name mcr-in-docker -d docker:dind
docker run --rm --link mcr-in-docker:docker docker sh
docker run --rm --link mcr-in-docker:docker docker info
docker run --rm --link mcr-in-docker:docker docker pull mcr.microsoft.com/linux-samples:latest
docker run --rm --link mcr-in-docker:docker docker images mcr.microsoft.com/linux-samples:latest
docker run --rm --link mcr-in-docker:docker docker rmi -f mcr.microsoft.com/linux-samples:latest