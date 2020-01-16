#!/bin/bash

set -e

for version in $@
do
  export TAG=${version}

  export ELASTICSEARCH_TAG=$TAG
  if [ "$TAG" = "5.0.2" ] || [ "$TAG" = "5.0.3" ]
  then
    # 5.0.2 and 5.0.3 are not available on the hub
    export ELASTICSEARCH_TAG=5.0.1
  fi
  docker build --build-arg TAG=$TAG --build-arg ELASTICSEARCH_TAG=$ELASTICSEARCH_TAG -t vdesabou/kafka-docker-playground-connect:$TAG .

  docker push vdesabou/kafka-docker-playground-connect:$TAG
done