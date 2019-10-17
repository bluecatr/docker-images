#!/usr/bin/env bash

USERNAME="bluecatr"
read -p "Github(${USERNAME}) password=" PASSWORD
echo ''

ORGANIZATION="bluecatr"
IMAGE="mosquitto"
read -p "Image(${IMAGE}) tag=" TAG
echo ''

echo "Request token...."
TOKEN=`curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'$USERNAME'", "password": "'$PASSWORD'"}' https://hub.docker.com/v2/users/login/ | jq -r .token`
echo "token is ready!"
curl "https://hub.docker.com/v2/repositories/${ORGANIZATION}/${IMAGE}/tags/${TAG}/" -X DELETE -H "Authorization: JWT ${TOKEN}"
