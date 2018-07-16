#!/bin/bash

source common.sh

while getopts "r:" opt; do
  case $opt in
        r)
          r=$OPTARG
	  ;;
	*)
	  echo "Usage: $0 -r <regionEndpoint>" 1>&2
	  exit 1
	  ;;
  esac
done

#expectSuccess docker run --privileged --name mcr-in-docker -d docker:dind
#expectSuccess docker run -it --rm --link mcr-in-docker:docker docker sh
expectSuccess docker run -it --rm --link mcr-in-docker:docker docker info
expectSuccess docker images
hostsMap $r
dockerOperation $r

summary
