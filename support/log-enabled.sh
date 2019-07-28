#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$LOG_ENABLED" ]; then
  LOG_ENABLED=$(awk -F "=" '/^LOG_ENABLED/ {print $2}' $ENV)
fi

if [ ! -z "$LOG_ENABLED" ]; then
  if [ "x$LOG_ENABLED" != "xoff" ]; then
    echo 1
  fi
fi
