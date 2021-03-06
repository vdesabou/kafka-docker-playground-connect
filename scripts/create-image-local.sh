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

# jmx exporter java agent
wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.12.0/jmx_prometheus_javaagent-0.12.0.jar

path_to_local_connector=$1
shift
cp $path_to_local_connector .
export CONNECTOR=$(basename -- "$path_to_local_connector")

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

  retry docker build -f Dockerfile-local \
      --build-arg TAG=$TAG \
      --build-arg CONNECTOR=$CONNECTOR \
      --build-arg CP_CONNECT_IMAGE=$CP_CONNECT_IMAGE \
      --build-arg TAG_BASE=$TAG_BASE \
      --build-arg CONNECT_USER=$CONNECT_USER \
      -t vdesabou/kafka-docker-playground-connect:$TAG .

done

rm -rf jmx_prometheus_javaagent-0.12.0.jar $CONNECTOR
