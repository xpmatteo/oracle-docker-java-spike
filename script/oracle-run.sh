#!/bin/bash

set -e
cd $(dirname $0)/..
source script/lib/common.sh

docker run -d -it --name $ORACLE_CONTAINER_NAME \
  -p 1521:1521 \
  --mount src="$(pwd)",target=/tmp/outside,type=bind \
  store/oracle/database-enterprise:12.2.0.1-slim

# wait until the instance claims to be healthy
n=0
while ! docker ps -l | grep -q healthy; do
  n=$(( $n + 1 ))
  echo $n
  sleep 1
done

echo "Instance claims to be healthy; waiting another 10 seconds for extra safety"

# wait another 10 seconds
n=10
while [[ $n -gt 0 ]]; do
  echo $n
  n=$(( $n - 1 ))
  sleep 1
done

echo "DB is ready"
