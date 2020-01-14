#!/bin/bash

for version in $@
do
  export TAG=${version}

  docker build --build-arg TAG=$TAG -t vdesabou/kafka-docker-playground-connect:$TAG .

  docker push vdesabou/kafka-docker-playground-connect:$TAG
done