#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
RECORD_NAME=`${DIR}/record-name.sh`
DEBUG=`${DIR}/debug.sh`

RECORD_ID=`${DIR}/cloudflare-curl.sh -m GET -p dns_records?name=$RECORD_NAME` 


if [ ! -z "$DEBUG" ]; then
  echo $RECORD_ID
else
  echo $RECORD_ID | sed -n 's|.*"id":"\([^"]*\)".*|\1|p'
fi
