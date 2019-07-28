#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
RECORD_NAME=`${DIR}/record-name.sh`

RECORD_ID=`DEBUG=off ${DIR}/cloudflare-curl.sh -m GET -p dns_records?name=$RECORD_NAME` 


echo $RECORD_ID | sed -n 's|.*"id":"\([^"]*\)".*|\1|p'
