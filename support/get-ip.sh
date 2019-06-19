#!/bin/bash
DIR="$( cd "$(dirname "$0")" ; pwd -P )"
IP_TYPE=`${DIR}/ip-type.sh`
INTERFACE=`${DIR}/interface.sh`

hexToDecIp()
{
  n=$(echo $(($1)))
  n1=$(($n >> 24))
  n2=$(( ($n >> 16) & 0xFF))
  n3=$(( ($n >> 8) & 0xFF))
  n4=$(($n & 0xFF))

  DEC_IP=$(printf "%d.%d.%d.%d" $n1 $n2 $n3 $n4)
}

inetInfo ()
{
  IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}')
}

netinfo ()
{
    IP=""
    MASK=""
    NET=""

    for NIC in "$@" ; do
        {
        IP=`ifconfig $NIC | sed -n -E 's/(inet |inet addr)/\1/p' | awk '{print $2}' | sed -e "s/addr\://"`
        MASK=`ifconfig $NIC | sed -n -E 's/(inet |inet addr)/\1/p' | awk '{print $4}' | sed -e "s/Mask\://"`
        IP1=`echo $IP |awk -F'.' '{print $1}'`
        if [ "$IP1" = "" ]; then
          echo ""
          echo "Warning: there is no IP found on $NIC."
          echo "Action is aborted."
          echo "Please make sure the interface is setup properly, then try again."
          echo ""
          exit 1
        else
          IP2=`echo $IP |awk -F'.' '{print $2}'`
          IP3=`echo $IP |awk -F'.' '{print $3}'`
          IP4=`echo $IP |awk -F'.' '{print $4}'`
          MASK2=`echo $MASK |awk -F'.' '{print $2}'`
          if [ -z $MASK2 ]; then
            hexToDecIp $MASK
            MASK=$DEC_IP
            MASK2=`echo $MASK |awk -F'.' '{print $2}'`
          fi
          MASK1=`echo $MASK |awk -F'.' '{print $1}'`
          MASK3=`echo $MASK |awk -F'.' '{print $3}'`
          MASK4=`echo $MASK |awk -F'.' '{print $4}'`
          let NET1="$IP1 & $MASK1"
          let NET2="$IP2 & $MASK2"
          let NET3="$IP3 & $MASK3"
          let NET4="$IP4 & $MASK4"
          NET="$NET1.$NET2.$NET3.$NET4"
        fi
        }
    done
}

getLanIp() {
if [ -z $INTERFACE ]; then
  inetInfo
else
  netinfo "$INTERFACE"
fi
MY_IP=$IP
}

getWanIp() {
 cmd="curl -s 'http://ipecho.net/plain'"
 if [ ! -z $INTERFACE ]; then
  cmd+=" --interface $INTERFACE"
 fi
 MY_IP=$(echo "$cmd" | bash)
}

if [ -z "$MY_IP" ]; then
  if [ "$IP_TYPE" = "lan" ]; then
    getLanIp
  else
    getWanIp
  fi
fi

echo $MY_IP
