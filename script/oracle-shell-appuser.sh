#!/bin/bash

set -e
cd $(dirname $0)/..
source script/lib/common.sh

# ORACLE_PATH is defined so that sqlplus will autoload login.sql in the db
# folder, which is mounted in the container under /tmp/outside
exec docker exec -it $ORACLE_CONTAINER_NAME \
  bash -c "source /home/oracle/.bashrc; export ORACLE_PATH=/tmp/outside/db; sqlplus appuser/appuser@ORCLPDB1"
 
