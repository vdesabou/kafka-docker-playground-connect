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
  second_version=5.3.0
  if version_gt $first_version $second_version; then
      export CP_CONNECT_IMAGE=cp-server-connect-base
  else
      export CP_CONNECT_IMAGE=cp-kafka-connect-base
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

  retry docker build --build-arg TAG=$TAG --build-arg CP_CONNECT_IMAGE=$CP_CONNECT_IMAGE --build-arg TAG_BASE=$TAG_BASE --build-arg TAG_JDBC=$TAG_JDBC --build-arg CONNECT_USER=$CONNECT_USER -t vdesabou/kafka-docker-playground-connect:$TAG .

  #docker push vdesabou/kafka-docker-playground-connect:$TAG
done
