#!/bin/bash

set -e

for version in $@
do
  export TAG=${version}

  export EXCEPTION_TAG=$TAG
  if [ "$TAG" = "5.0.2" ] || [ "$TAG" = "5.0.3" ]
  then
    # 5.0.2 and 5.0.3 are not available on the hub
    export EXCEPTION_TAG=5.0.1
  fi
  docker build --build-arg TAG=$TAG --build-arg EXCEPTION_TAG=$EXCEPTION_TAG -t vdesabou/kafka-docker-playground-connect:$TAG .

  docker push vdesabou/kafka-docker-playground-connect:$TAG
done