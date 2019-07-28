#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$RECORD_NAME" ]; then
  RECORD_NAME=$(awk -F "=" '/^RECORD_NAME/ {print $2}' $ENV)
fi

echo $RECORD_NAME
