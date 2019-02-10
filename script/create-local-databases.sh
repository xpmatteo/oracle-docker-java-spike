#!/bin/bash

set -e
cd $(dirname $0)/..
source script/lib/common.sh

docker exec -it $ORACLE_CONTAINER_NAME \
  bash -c "source /home/oracle/.bashrc; sqlplus SYS/Oradoc_db1@ORCLPDB1 as sysdba @/tmp/outside/script/lib/create-application-user.sql"
docker exec -it $ORACLE_CONTAINER_NAME \
  bash -c "source /home/oracle/.bashrc; sqlplus appuser/appuser@ORCLPDB1 @/tmp/outside/script/lib/create-tables.sql"
docker exec -it $ORACLE_CONTAINER_NAME \
  bash -c "source /home/oracle/.bashrc; sqlplus testuser/testuser@ORCLPDB1 @/tmp/outside/script/lib/create-tables.sql"

