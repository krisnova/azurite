#!/usr/bin/env bash

PUBLIC_KEY="${HOME}/.ssh/id_rsa.pub"
DNS_PREFIX="my"


BIN_DIR=`dirname "$BASH_SOURCE"`
NAME=$(az account show | jq -r .user.name)

if [ -z $NAME ]; then
    echo "Please (az login) and try again"
    exit 1
fi

if [ -z $AZURE_SUBSCRIPTION_ID ]; then
    echo "Please export $AZURE_SUBSCRIPTION_ID and try again"
    exit 1
fi

# Begin Kubernetes
echo "Creating a new Kubernetes cluster for [${NAME}]"

# Service Principle Hackery
#SPJSON=$(az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/${AZURE_SUBSCRIPTION_ID}")
SPJSON=$(cat $BIN_DIR/_sp.json)
SP_APP_ID=$(echo ${SPJSON} | jq  -r .appId)
SP_NAME=$(echo ${SPJSON} | jq  -r .name)
SP_PASSWORD=$(echo ${SPJSON} | jq  -r .password)
SP_TENANT=$(echo ${SPJSON} | jq  -r .tenant)

# Generate ID
TMP_FILE=$(mktemp)
ID=$(md5sum ${TMP_FILE} | cut -d " " -f 1)
echo "ID: [${ID}]"

PUBKEY=$(cat ${PUBLIC_KEY})

# Edit Template

cat bin/_kubernetes.json | sed -e "s/password/${SP_PASSWORD}/g" | sed -e "s/appid/${SP_APP_ID}/g" | sed -e "s|pubkey|${PUBKEY}|g" | sed -e "s/prefix/${DNS_PREFIX}/g" > ${TMP_FILE}

${EDITOR} ${TMP_FILE}
