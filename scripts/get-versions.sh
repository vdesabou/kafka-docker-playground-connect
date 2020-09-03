#!/bin/bash

set -e

image_version=$1
template_file=README-template.md
readme_file=README.md
readme_tmp_file=/tmp/README.md

cp $template_file $readme_tmp_file
echo "| connector  | version |" >> $readme_tmp_file
echo "|---|---|" >> $readme_tmp_file
for dir in $(docker run vdesabou/kafka-docker-playground-connect:${image_version} ls /usr/share/confluent-hub-components/)
do
    version=$(docker run vdesabou/kafka-docker-playground-connect:${image_version} cat /usr/share/confluent-hub-components/${dir}/manifest.json | jq -r '.version')

    echo "| $dir  | $version |" >> $readme_tmp_file
done

cp $readme_tmp_file $readme_file

set -x
if [ ! -z "$TRAVIS" ]
then
     # running with travis
    git config --global user.email "$GH_EMAIL"
    git config --global user.name "$GH_USERNAME"
fi

git add $readme_file
git commit --message "Updating with latest version (travis build $TRAVIS_BUILD_NUMBER)"
git push -v https://$GH_TOKEN@github.com/vdesabou/kafka-docker-playground-connect.git master



# git config user.email "${GIT_COMMITTER_EMAIL}"
# git config user.name "${GIT_COMMITTER_NAME}"
# git remote rm origin
# git remote add origin https://${GIT_COMMITTER_ACCOUNT}:${GITHUB_API_TOKEN}@yourrepo.git > /dev/null 2>&1"
# git commit -am 'Commit message'
# git push origin HEAD:<yourbranch>