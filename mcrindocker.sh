#!/bin/bash

docker info
docker run --privileged --name mcr-in-docker -d docker:dind
docker run -it --rm --link mcr-in-docker:docker docker sh
docker info
docker images
docker pull mcr.microsoft.com/linux-samples:latest
docker images mcr.microsoft.com/linux-samples:latest
docker rmi -f mcr.microsoft.com/linux-samples:latest