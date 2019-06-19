#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$AUTH_KEY" ]; then
  AUTH_KEY=$(awk -F "=" '/AUTH_KEY/ {print $2}' $ENV)
fi

echo $AUTH_KEY
