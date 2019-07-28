#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$PROXIED" ]; then
  PROXIED=$(awk -F "=" '/^PROXIED/ {print $2}' $ENV)
fi

PROXIED=$(echo "$PROXIED" | awk '{print tolower($0)}')

if [[ -z "$PROXIED" || "x$PROXIED" == "xfalse" ]]; then
  echo false
else
  echo true
fi
