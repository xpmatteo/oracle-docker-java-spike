#!/bin/bash

set -e
cd $(dirname $0)/..
source script/lib/common.sh

exec docker exec -it $ORACLE_CONTAINER_NAME bash -c "source /home/oracle/.bashrc; sqlplus SYS/Oradoc_db1@ORCLPDB1 as sysdba"
 
