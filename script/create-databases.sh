
docker exec -it mydb bash -c "source /home/oracle/.bashrc; sqlplus SYS/Oradoc_db1@ORCLPDB1 as sysdba @/tmp/outside/script/lib/create-application-user.sql"
docker exec -it mydb bash -c "source /home/oracle/.bashrc; sqlplus appuser/appuser@ORCLPDB1 @/tmp/outside/script/lib/create-tables.sql"

