#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$RECORD_TYPE" ]; then
  RECORD_TYPE=$(awk -F "=" '/RECORD_TYPE/ {print $2}' $ENV)
  if [ -z "$RECORD_TYPE" ]; then
    RECORD_TYPE="A"
  fi
fi

echo $RECORD_TYPE
