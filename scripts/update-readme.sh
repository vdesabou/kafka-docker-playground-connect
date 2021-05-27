#!/bin/bash
set -e

image_version=$1
template_file=README-template.md
readme_file=README.md
readme_tmp_file=/tmp/README.md

cp $template_file $readme_tmp_file
echo "| connector  | version | license | owner | release date |" >> $readme_tmp_file
echo "|---|---|---|---|---|" >> $readme_tmp_file
for dir in $(docker run vdesabou/kafka-docker-playground-connect:${image_version} ls /usr/share/confluent-hub-components/)
do
    version=$(docker run vdesabou/kafka-docker-playground-connect:${image_version} cat /usr/share/confluent-hub-components/${dir}/manifest.json | jq -r '.version')
    license=$(docker run vdesabou/kafka-docker-playground-connect:${image_version} cat /usr/share/confluent-hub-components/${dir}/manifest.json | jq -r '.license[0].name')
    owner=$(docker run vdesabou/kafka-docker-playground-connect:${image_version} cat /usr/share/confluent-hub-components/${dir}/manifest.json | jq -r '.owner.name')
    release_date=$(docker run vdesabou/kafka-docker-playground-connect:${image_version} cat /usr/share/confluent-hub-components/${dir}/manifest.json | jq -r '.release_date')

    echo "| $dir  | $version | $license | $owner | $release_date |" >> $readme_tmp_file
done

cp $readme_tmp_file $readme_file

git diff $readme_file | grep '^+' | grep -v README | tr '\n' ' ' | sed 's/ //g' | sed 's/+//g' | sed 's/confluentinc-kafka-connect-//g' | sed 's/-debezium-connector//g' | sed 's/kafka-connect-//g' | sed 's/mongodb-//g' | sed 's/jcustenborder-//g'  | sed 's/-snowflake-kafka-connector//g' | sed 's/wepay-//g' | sed 's/splunk-//g' | sed 's/neo4j-//g'  | sed 's/||/ /g' | sed 's/^|//g' | sed 's/|/=/g' | sed 's/=$//g'
