#!/bin/bash

set -e
cd $(dirname $0)/..

source script/lib/common.sh

docker run -d -it --name $ORACLE_CONTAINER_NAME \
  -p 1521:1521 \
  --mount src="$(pwd)",target=/tmp/outside,type=bind \
  store/oracle/database-enterprise:12.2.0.1-slim

