#!/bin/bash
# set -ex
echo "set datanode localIP "
cp /conf/datanode.json /cfs/conf/datanode.json
sed -i "s/LOCALIP/$CBFS_DATANODE_LOCALIP/" /cfs/conf/datanode.json

mkdir -p /cfs/data/datanode/raft
cat /cfs/conf/datanode.json
echo "start datanode"
exec /cfs/bin/cfs-server -f {{ if .Values.log.do_not_redirect_std -}} -redirect-std=false {{- end }} -c /cfs/conf/datanode.json
