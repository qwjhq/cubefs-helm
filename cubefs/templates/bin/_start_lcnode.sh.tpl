#!/bin/bash
# set -ex

cat /cfs/conf/lcnode.json
echo "start lcnode"
exec /cfs/bin/cfs-server -f -c /cfs/conf/lcnode.json
