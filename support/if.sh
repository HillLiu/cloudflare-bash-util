#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV=`${DIR}/env.sh`

if [ -z "$IF" ]; then
  IF=$(awk -F "=" '/IF/ {print $2}' $ENV)
  if [ -z "$IF" ]; then
    IF="/sbin/ifconfig"
  fi
fi

echo $IF
