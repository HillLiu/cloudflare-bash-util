#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$AUTH_EMAIL" ]; then
  AUTH_EMAIL=$(awk -F "=" '/^AUTH_EMAIL/ {print $2}' $ENV)
fi

echo $AUTH_EMAIL
