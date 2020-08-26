#!/bin/bash

set -e

image_version=$1
template_file=README-template.md
readme_file=README.md

echo "| connector  | version |" >> $template_file
echo "|---|---|" >> $template_file
for dir in $(docker run vdesabou/kafka-docker-playground-connect:${image_version} ls /usr/share/confluent-hub-components/)
do
    version=$(docker run vdesabou/kafka-docker-playground-connect:${image_version} cat /usr/share/confluent-hub-components/${dir}/manifest.json | jq -r '.version')

    echo "| $dir  | $version |" >> $template_file
done

cp $template_file $readme_file

git remote add $readme_file https://${GH_TOKEN}@github.com/vdesabou/kafka-docker-playground-connect.git > /dev/null 2>&1
git commit --message "Updating with latest version (travis build $TRAVIS_BUILD_NUMBER)"
git push origin master