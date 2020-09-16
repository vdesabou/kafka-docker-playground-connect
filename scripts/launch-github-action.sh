#!/bin/bash

set -e

curl -H "Accept: application/vnd.github.everest-preview+json" \
    -H "Authorization: token $GH_TOKEN" \
    --request POST \
    --data '{"event_type": "Updating with latest version (travis build $TRAVIS_BUILD_NUMBER)"}' \
    https://api.github.com/repos/vdesabou/kafka-docker-playground/dispatches