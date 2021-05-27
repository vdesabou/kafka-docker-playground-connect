#!/bin/bash
set -e

image_version=$1
template_file=README-template.md
readme_file=README.md
readme_tmp_file=/tmp/README.md

if [ ! -d ${PWD}/confluent-hub-components${image_version} ]
then
docker rm -f kafka-docker-playground-connect${image_version}
docker create -ti --name kafka-docker-playground-connect${image_version} vdesabou/kafka-docker-playground-connect:${image_version} bash
docker cp kafka-docker-playground-connect${image_version}:/usr/share/confluent-hub-components ${PWD}/confluent-hub-components${image_version}
docker rm -f kafka-docker-playground-connect${image_version}
fi

cp $template_file $readme_tmp_file
echo "| connector  | version | license | owner | release date |" >> $readme_tmp_file
echo "|---|---|---|---|---|" >> $readme_tmp_file
for connector in $(ls ${PWD}/confluent-hub-components${image_version})
do
    version=$(cat ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json | jq -r '.version')
    license=$(cat ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json | jq -r '.license[0].name')
    owner=$(cat ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json | jq -r '.owner.name')
    release_date=$(cat ${PWD}/confluent-hub-components${image_version}/${connector}/manifest.json | jq -r '.release_date')

    echo "| $connector | $version | $license | $owner | $release_date |" >> $readme_tmp_file
done

cp $readme_tmp_file $readme_file

git diff $readme_file | grep '^+' | grep -v README | tr '\n' ' ' | sed 's/ //g' | sed 's/+//g' | sed 's/confluentinc-kafka-connect-//g' | sed 's/-debezium-connector//g' | sed 's/kafka-connect-//g' | sed 's/mongodb-//g' | sed 's/jcustenborder-//g'  | sed 's/-snowflake-kafka-connector//g' | sed 's/wepay-//g' | sed 's/splunk-//g' | sed 's/neo4j-//g'  | sed 's/||/ /g' | sed 's/^|//g' | sed 's/|/=/g' | sed 's/=$//g'
