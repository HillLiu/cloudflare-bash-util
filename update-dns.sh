#!/bin/bash
DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ZONE_ID=`${DIR}/support/zone-id.sh`
RECORD_TYPE=`${DIR}/support/record-type.sh`
RECORD_NAME=`${DIR}/support/record-name.sh`
RECORD_ID=`${DIR}/support/record-id.sh`
PROXIED=`${DIR}/support/proxied.sh`
MY_IP=`${DIR}/support/get-ip.sh`

update=`${DIR}/support/cloudflare-curl.sh -m PUT -p dns_records/${RECORD_ID} "{\"id\":\"$ZONE_ID\",\"type\":\"$RECORD_TYPE\",\"name\":\"$RECORD_NAME\",\"content\":\"$MY_IP\",\"proxied\":${PROXIED}}"`

echo $update;
