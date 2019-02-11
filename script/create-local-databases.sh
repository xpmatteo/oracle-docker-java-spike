#!/bin/bash

set -e
cd $(dirname $0)/..
source script/lib/common.sh

docker exec -it $ORACLE_CONTAINER_NAME \
  bash -c "source /home/oracle/.bashrc; sqlplus SYS/Oradoc_db1@ORCLPDB1 as sysdba @/tmp/outside/db/create-users.sql"


for user in appuser testuser; do
  url="jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCLPDB1.localdomain)))"
  
  java -jar lib/liquibase-core-3.5.3.jar \
    --changeLogFile="db/changeLog-master.xml" \
    --username="$user" \
    --password="$user" \
    --url="$url" \
    --classpath="lib/ojdbc8.jar" \
    --logLevel="warning" \
    update

  docker exec -it $ORACLE_CONTAINER_NAME \
    bash -c "source /home/oracle/.bashrc; sqlplus $user/$user@ORCLPDB1 @/tmp/outside/db/seed.sql"
done

