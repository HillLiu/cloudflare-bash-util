#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
RECORD_NAME=`${DIR}/record-name.sh`

FORCE_DEBUG=$1

if [ "--debug" == "$FORCE_DEBUG" ]; then
  DEBUG=on 
else
  DEBUG=off
fi

RECORD_ID=`DEBUG=${DEBUG} ${DIR}/cloudflare-curl.sh -m GET -p dns_records?name=$RECORD_NAME` 

if [ "x$DEBUG" == "xoff" ]; then
  echo $RECORD_ID | sed -n 's|.*"id"\s*:\s*"\([^"]*\)".*|\1|p'
else
  echo $RECORD_ID
fi
