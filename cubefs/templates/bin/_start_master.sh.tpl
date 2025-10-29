#!/bin/bash
# set -ex
echo "set master ID and IP "
CBFS_HOSTNAME_INDEX=`echo $POD_NAME | awk -F '-' '{print $2}'`
CBFS_ID=$(($CBFS_HOSTNAME_INDEX+1))
cp /conf/master.json /cfs/conf/master.json
sed -i "s/MASTERID/$CBFS_ID/" /cfs/conf/master.json
sed -i "s/MASTERIP/$POD_IP/" /cfs/conf/master.json


mkdir -p /cfs/data/master/raft
mkdir -p /cfs/data/master/rocksdbstore

cat /cfs/conf/master.json
echo "start master"
exec /cfs/bin/cfs-server -f {{ if .Values.log.do_not_redirect_std -}} -redirect-std=false {{- end }} -c /cfs/conf/master.json