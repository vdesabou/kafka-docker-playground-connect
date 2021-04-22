#!/bin/bash

set -e

function log() {
  YELLOW='\033[0;33m'
  NC='\033[0m' # No Color
  echo -e "$YELLOW$@$NC"
}

function logerror() {
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  echo -e "$RED$@$NC"
}

function logwarn() {
  PURPLE='\033[0;35m'
  NC='\033[0m' # No Color
  echo -e "$PURPLE$@$NC"
}

function retry() {
  local n=1
  local max=3
  while true; do
    "$@" && break || {
      if [[ $n -lt $max ]]; then
        ((n++))
        logwarn "Command failed. Attempt $n/$max:"
      else
        logerror "The command has failed after $n attempts."
        return 1
      fi
    }
  done
}

# https://stackoverflow.com/a/24067243
function version_gt() { test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"; }


function docker_tag_exists() {
    curl --silent -f -lSL https://index.docker.io/v1/repositories/$1/tags/$2 > /dev/null
}

# jmx exporter java agent
wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.12.0/jmx_prometheus_javaagent-0.12.0.jar

for version in $@
do
  if docker_tag_exists confluentinc/cp-server-connect-operator "${version}.0"
  then
    export TAG=${version}
    # to handle ubi8 images
    export TAG_BASE=$(echo $TAG | cut -d "-" -f1)

    if [[ "$TAG" == *ubi8 ]] || version_gt $TAG_BASE "5.9.0"
    then
      CONNECT_USER="appuser"
    else
      CONNECT_USER="root"
    fi

    TAG_JDBC="latest"
    if ! version_gt $TAG_BASE "5.9.0"; then
      # for version less than 6.0.0, use JDBC with same version
      # see https://github.com/vdesabou/kafka-docker-playground/issues/221
      TAG_JDBC=$TAG_BASE
    fi

    if [ "$TAG_BASE" = "5.0.2" ] || [ "$TAG_BASE" = "5.0.3" ]
    then
      TAG_JDBC="5.0.1"
    fi

    retry docker build -f Dockerfile-operator --build-arg TAG=$TAG --build-arg TAG_BASE=$TAG_BASE --build-arg TAG_JDBC=$TAG_JDBC --build-arg CONNECT_USER=$CONNECT_USER -t vdesabou/kafka-docker-playground-connect-operator:$TAG .

    docker push vdesabou/kafka-docker-playground-connect-operator:$TAG
  else
    logwarn "confluentinc/cp-server-connect-operator ${version}.0 does not exist"
    continue
  fi

done
