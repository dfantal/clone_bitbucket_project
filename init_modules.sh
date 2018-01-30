#!/bin/bash

## Collect BitBucket credentials

echo -n "Bitbucket Host (company.bitbucket.com):"
read host
echo -n "BitBucket Username:"
read username
echo -n "BitBucket Password:"
read -s password
echo
echo -n "BitBucket Project Key:"
read project

## Get all repos in BitBucket project by finding links with "ssh://" and contain the project key.

URL=https://$host/rest/api/1.0/projects/$project/repos?limit=1000

echo $URL

JSON=$(curl -u $username:$password -X GET -H "Content-Type: application/json" $URL)

REPOS=($(echo ${JSON} | awk -v project=$project 'BEGIN { RS = "\"";} {if($1 ~ "ssh://" && $1 ~ project) print $1 "\n"}'))

## Create directory to put code in and init as git repo with submodules.

mkdir $project
cd $project
git init
git submodule init

## For each repo, add it as a submodule. This will clone the repo into the parent project directory.

for repo in ${REPOS[@]}
do
	git submodule add "$repo"
done
