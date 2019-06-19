#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"

if [ -z "$ENV" ]; then
  if [ -e "${DIR}/../.env" ]; then
    ENV="${DIR}/../.env"
  else
    ENV="${DIR}/../.env.sample"
  fi
fi

echo $ENV
