#!/bin/bash
# set -ex
echo "set metanode localIP "
cp /conf/metanode.json /cfs/conf/metanode.json
sed -i "s/LOCALIP/$CBFS_METANODE_LOCALIP/" /cfs/conf/metanode.json

mkdir -p /cfs/data/metanode/raft

cat /cfs/conf/metanode.json
echo "start master"
exec /cfs/bin/cfs-server -f {{ if .Values.log.do_not_redirect_std -}} -redirect-std=false {{- end }} -c /cfs/conf/metanode.json