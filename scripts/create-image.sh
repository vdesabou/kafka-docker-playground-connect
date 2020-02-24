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
  local max=5
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

for version in $@
do
  export TAG=${version}
  ORIGINAL_TAG=$TAG

  export EXCEPTION_TAG=$TAG
  if [ "$TAG" = "5.0.2" ] || [ "$TAG" = "5.0.3" ]
  then
    # 5.0.2 and 5.0.3 are not available on the hub
    export EXCEPTION_TAG=5.0.1
  fi
  if [ "$TAG" = "5.4.0-1-ubi8" ]
  then
    export EXCEPTION_TAG=5.4.0
    export TAG=5.4.0
  fi
  retry docker build --build-arg TAG=$TAG --build-arg EXCEPTION_TAG=$EXCEPTION_TAG -t vdesabou/kafka-docker-playground-connect:$ORIGINAL_TAG .

  docker push vdesabou/kafka-docker-playground-connect:$ORIGINAL_TAG
done