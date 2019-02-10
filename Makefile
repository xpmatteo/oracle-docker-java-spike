
DBNAME=mydb

oracle-run:
	docker run -it --name $(DBNAME) -p 1521:1521 --mount src="$(shell pwd)",target=/tmp/outside,type=bind store/oracle/database-enterprise:12.2.0.1-slim

oracle-shell-dba:
	docker exec -it $(DBNAME) bash -c "source /home/oracle/.bashrc; sqlplus SYS/Oradoc_db1@ORCLPDB1 as sysdba"

oracle-shell-appuser:
	docker exec -it $(DBNAME) bash -c "source /home/oracle/.bashrc; sqlplus appuser/appuser@ORCLPDB1"
	
