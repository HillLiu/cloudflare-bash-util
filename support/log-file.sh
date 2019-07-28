#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$LOG_FILE" ]; then
  LOG_FILE=$(awk -F "=" '/^LOG_FILE/ {print $2}' $ENV)
  if [ -z "$LOG_FILE" ]; then
    LOG_FILE=${DIR}/../result.log
  fi
fi

echo $($DIR/real-path.sh ${LOG_FILE})
