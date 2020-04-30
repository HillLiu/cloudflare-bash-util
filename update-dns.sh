#!/bin/bash
DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ZONE_ID=`${DIR}/support/zone-id.sh`
RECORD_TYPE=`${DIR}/support/record-type.sh`
RECORD_NAME=`${DIR}/support/record-name.sh`
RECORD_ID=`${DIR}/support/record-id.sh`
PROXIED=`${DIR}/support/proxied.sh`
MY_IP=`${DIR}/support/get-ip.sh`

LOG_ENABELED=`${DIR}/support/log-enabled.sh`
LOG_FILE=`${DIR}/support/log-file.sh`
ERROR_LOG_FILE=`${DIR}/support/error-log-file.sh`

json='{"id":"'
json+=$ZONE_ID
json+='","type":"'
json+=$RECORD_TYPE
json+='","name":"'
json+=$RECORD_NAME
json+='","content":"'
json+=$MY_IP
json+='","proxied":'
json+=$PROXIED
json+='}'
update="${DIR}/support/cloudflare-curl.sh -m PUT -p dns_records/${RECORD_ID} '${json}'"

if [ -z "$RECORD_ID" ]; then
  echo "Get RECORD_ID failed."
  exit 1;
fi

if [ -z "$LOG_ENABELED" ]; then 
  result=$(echo $update | bash)
  echo $result;
else
  result=$(echo $update | bash >> $LOG_FILE 2>> $ERROR_LOG_FILE)
  echo "Log file @ ${LOG_FILE}"
  echo "Error log file @ ${ERROR_LOG_FILE}"
fi

