#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$DEBUG" ]; then
  DEBUG=$(awk -F "=" '/^DEBUG/ {print $2}' $ENV)
fi

if [ ! -z "$DEBUG" ]; then
  if [ "x$DEBUG" != "xoff" ]; then
    echo 1
  fi
fi
