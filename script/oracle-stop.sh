#!/bin/bash

set -e
cd $(dirname $0)/..
source script/lib/common.sh

docker kill $ORACLE_CONTAINER_NAME
docker rm $ORACLE_CONTAINER_NAME
