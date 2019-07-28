#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$IP_TYPE" ]; then
  IP_TYPE=$(awk -F "=" '/^IP_TYPE/ {print $2}' $ENV)
fi

echo $IP_TYPE
