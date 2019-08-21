#!/bin/bash
DIR="$( cd "$(dirname "$0")" ; pwd -P )"
LAN_IP=$(IP_TYPE=lan ${DIR}/get-ip.sh);

echo $LAN_IP
