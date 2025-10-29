#!/bin/bash

# set -ex

cat /cfs/conf/cfs-config.yml
echo "start dashboard"
exec /cfs/bin/cfs-gui -c /cfs/conf/cfs-config.yml
