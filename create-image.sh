#!/bin/bash

if [ -z "$1" ]
  then
    echo "ERROR: No argument supplied. cp-kafka-connect-base version must be provided."
    exit 1
fi

export TAG=$1

docker build --build-arg TAG=$TAG -t vdesabou/kafka-docker-playground-connect:$TAG .

docker push vdesabou/kafka-docker-playground-connect:$TAG