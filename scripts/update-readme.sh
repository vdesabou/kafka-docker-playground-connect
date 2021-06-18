#!/bin/bash
set -e

image_version=$1
template_file=README-template.md
readme_file=README.md
readme_tmp_file=/tmp/README.md

if [ ! -d ${PWD}/confluent-hub-components${image_version} ]
then
    docker rm -f kafka-docker-playground-connect${image_version} > /dev/null 2>&1
    docker create -ti --name kafka-docker-playground-connect${image_version} vdesabou/kafka-docker-playground-connect:${image_version} bash > /dev/null 2>&1
    docker cp kafka-docker-playground-connect${image_version}:/usr/share/confluent-hub-components ${PWD}/confluent-hub-components${image_version} > /dev/null 2>&1
    docker rm -f kafka-docker-playground-connect${image_version} > /dev/null 2>&1
fi

cp $template_file $readme_tmp_file
echo "| connector  | version | license | owner | release date | documentation |" >> $readme_tmp_file
echo "|---|---|---|---|---|---|" >> $readme_tmp_file
for connector in $(ls ${PWD}/confluent-hub-components${image_version})
do
    if [ -f ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json ]
    then
        version=$(cat ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json | jq -r '.version')
        license=$(cat ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json | jq -r '.license[0].name')
        owner=$(cat ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json | jq -r '.owner.name')
        release_date=$(cat ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json | jq -r '.release_date')
        documentation_url=$(cat ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json | jq -r '.documentation_url')

        echo "| $connector | $version | $license | $owner | $release_date | [documentation]($documentation_url) |" >> $readme_tmp_file
    fi
done

cp $readme_tmp_file $readme_file

git diff $readme_file | grep '^+' | grep -v README | awk -F'|' '{print $2 FS $3 FS}'  | sed 's/|$/\//' | tr '\n' ' ' | sed 's/ //g' | sed 's/+//g' | sed 's/confluentinc-kafka-connect-//g' | sed 's/-debezium-connector//g' | sed 's/kafka-connect-//g' | sed 's/mongodb-//g' | sed 's/jcustenborder-//g'  | sed 's/-snowflake-kafka-connector//g' | sed 's/wepay-//g' | sed 's/splunk-//g' | sed 's/neo4j-//g'  | sed 's/||/ /g' | sed 's/^|//g' | sed 's/|/=/g' | sed 's/=$//g'
