#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$INTERFACE" ]; then
  INTERFACE=$(awk -F "=" '/^INTERFACE/ {print $2}' $ENV)
fi

echo $INTERFACE
