#!/bin/bash

function getrepos() {
    local result=`cat repos.json | jq -r ".repotype$1.repo"`
    echo $result
  }

function syncrepos() {
    sourcerepo=$1

    execsync $2
}

function execsync() {
    for i in {1..2}
    do
        targetrepo=$(getrepos $1$i)
        git clone $targetrepo
        cd $1${targetrepo#*/$1}
        git pull $sourcerepo
        git push origin
    done
}

echo "Start"
syncrepos "https://github.com/docker/distribution.git" "distribution"
syncrepos "https://github.com/Microsoft/iis-docker.git" "iis"
echo "Done"