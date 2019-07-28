#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$ERROR_LOG_FILE" ]; then
  ERROR_LOG_FILE=$(awk -F "=" '/^ERROR_LOG_FILE/ {print $2}' $ENV)
  if [ -z "$ERROR_LOG_FILE" ]; then
    ERROR_LOG_FILE=${DIR}/../error.log
  fi
fi

echo $($DIR/real-path.sh $ERROR_LOG_FILE)
