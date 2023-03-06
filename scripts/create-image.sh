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

function docker_tag_exists() {
    docker manifest inspect $1:$2 > /dev/null
}

# https://stackoverflow.com/a/24067243
function version_gt() { test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"; }

for version in $@
do
  export TAG=${version}
  # to handle ubi8 images
  export TAG_BASE=$(echo $TAG | cut -d "-" -f1)

  if [[ "$TAG" == *ubi8 ]] || version_gt $TAG_BASE "5.9.0"
  then
    CONNECT_USER="appuser"
  else
    CONNECT_USER="root"
  fi

  first_version=${TAG_BASE}
  second_version=5.2.99
  if version_gt $first_version $second_version; then
      if [ "$first_version" == "5.3.6" ]
      then
        logwarn "Workaround for ST-6539, using custom image vdesabou/cp-server-connect-base !"
        export CP_CONNECT_IMAGE=vdesabou/cp-server-connect-base
      else
        export CP_CONNECT_IMAGE=confluentinc/cp-server-connect-base
      fi
  else
      export CP_CONNECT_IMAGE=confluentinc/cp-kafka-connect-base
  fi
  
  TAG_JDBC="latest"
  if ! version_gt $TAG_BASE "5.9.0"; then
    # for version less than 6.0.0, use JDBC I' with same version
    # see https://github.com/vdesabou/kafka-docker-playground/issues/221
    TAG_JDBC=$TAG_BASE
  fi

  if [ "$TAG_BASE" = "5.0.2" ] || [ "$TAG_BASE" = "5.0.3" ]
  then
    TAG_JDBC="5.0.1"
  fi

  if docker_tag_exists vdesabou/kafka-docker-playground-connect $TAG
  then
      log "vdesabou/kafka-docker-playground-connect:$TAG already exists, skipping..."
  else 
    retry docker build --build-arg TAG=$TAG --build-arg CP_CONNECT_IMAGE=$CP_CONNECT_IMAGE --build-arg TAG_BASE=$TAG_BASE --build-arg TAG_JDBC=$TAG_JDBC --build-arg CONNECT_USER=$CONNECT_USER -t vdesabou/kafka-docker-playground-connect:$TAG .

    docker push vdesabou/kafka-docker-playground-connect:$TAG
  fi


# https://medium.com/geekculture/docker-build-with-mac-m1-d668c802ab96

# docker buildx build --build-arg TAG=7.3.2 --build-arg CP_CONNECT_IMAGE=confluentinc/cp-server-connect-base --build-arg TAG_BASE=7.3.2 --build-arg TAG_JDBC=latest --build-arg CONNECT_USER=appuser --push --tag vdesabou/kafka-docker-playground-connect:7.3.2 -o type=image --platform=linux/arm64,linux/amd64 .
done
