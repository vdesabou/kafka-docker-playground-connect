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

# https://stackoverflow.com/a/24067243
function version_gt() { test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"; }

# specific to couchbase connector
wget https://packages.couchbase.com/clients/kafka/3.4.8/kafka-connect-couchbase-3.4.8.zip
unzip kafka-connect-couchbase-3.4.8.zip

for version in $@
do
  export TAG=${version}
  # to handle ubi8 images
  export TAG_BASE=$(echo $TAG | cut -d "-" -f1)

  first_version=${TAG_BASE}
  second_version=5.3.0
  if version_gt $first_version $second_version; then
      export CP_CONNECT_IMAGE=cp-server-connect-base
  else
      export CP_CONNECT_IMAGE=cp-kafka-connect-base
  fi

  retry docker build --build-arg TAG=$TAG --build-arg CP_CONNECT_IMAGE=$CP_CONNECT_IMAGE --build-arg TAG_BASE=$TAG_BASE -t vdesabou/kafka-docker-playground-connect:$TAG .

  docker push vdesabou/kafka-docker-playground-connect:$TAG
done

rm -rf kafka-connect-couchbase-3.4.8 kafka-connect-couchbase-3.4.8.zip