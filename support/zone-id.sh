#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$ZONE_ID" ]; then
  ZONE_ID=$(awk -F "=" '/ZONE_ID/ {print $2}' $ENV)
fi

echo $ZONE_ID
