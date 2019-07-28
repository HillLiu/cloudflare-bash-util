#!/bin/bash
DIR="$( cd "$(dirname "$0")" ; pwd -P )"
AUTH_EMAIL=`${DIR}/auth-email.sh`
AUTH_KEY=`${DIR}/auth-key.sh`
ZONE_ID=`${DIR}/zone-id.sh`
DEBUG=`${DIR}/debug.sh`

usage()
{
  echo -n "
  cloudflare-curl.sh -m [METHOD] -p [PATH] your-data 
"
}

data=''

while [[ $# -gt 0 ]];  do
    key="$1"
    case $key in
      -h|--help)
        usage
        exit
        ;;
      -m|--method)
        CURL_METHOD=$2
        shift
        ;;
      -p|--path)
        CURL_PATH=$2
        shift
        ;;
      --debug)
        DEBUG=on
        ;;
      *)
      data+=$key
      data+=' '
      ;;
    esac
    shift # past argument or value
done

data=$(echo -e "${data}" |  sed -e 's/^[[:space:]]//' -e 's/[[:space:]]$//')

cmd="curl -s -X ${CURL_METHOD}"
cmd+=" 'https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/${CURL_PATH}'"
cmd+=" -H 'Content-Type:application/json'"

# Auth
cmd+=" -H 'X-Auth-Key:${AUTH_KEY}'"
cmd+=" -H 'X-Auth-Email:${AUTH_EMAIL}'"

if [ ! -z "$data" ]; then
  cmd+=" --data '${data}';"
fi

if [ ! -z "$DEBUG" ]; then
  echo $cmd
else
  result=$(echo "$cmd" | bash)
  if [[ $result == *"\"success\":false"* ]]; then
    >&2 echo "$result --- $cmd"
  else
    echo "$result"
  fi
fi
