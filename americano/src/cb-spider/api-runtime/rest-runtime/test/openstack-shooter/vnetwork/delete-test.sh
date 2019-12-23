#!/bin/bash
source ../setup.env

for NAME in "${CONNECT_NAMES[@]}"
do
        ID=`curl -sX GET http://$RESTSERVER:1024/vnetwork?connection_name=${NAME} |json_pp |grep "\"Id\"" |awk '{print $3}' |sed 's/"//g' |sed 's/,//g'`
        curl -sX DELETE http://$RESTSERVER:1024/vnetwork/${ID}?connection_name=${NAME} |json_pp
done

