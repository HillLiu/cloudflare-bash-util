#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$PROXIED" ]; then
  PROXIED=$(awk -F "=" '/PROXIED/ {print $2}' $ENV)
fi

echo $PROXIED
