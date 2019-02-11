
Example of how to 

  * run an Oracle DB in docker, 
  * automatically create an application user and a test user 
  * automatically create the database schema in the app and test databases
  * using liquibase to manage schema migration
  * connect to the db from a Java program.

Download the Oracle JDBC driver from Oracle, and put `ojdbc8.jar` in the `lib` folder.

Run oracle with

    script/oracle-run.sh

Wait until `docker ps` shows that the `mydb` container status is "healthy".

Create the local databases with:

    script/create-local-databases.sh

If you see "bash: sqlplus: command not found", it is probably because the Oracle container status is not yet "healthy".

If you see "ORA-12514: TNS:listener does not currently know of service requested in connect", then you should wait another 10 seconds or so and try again.

Run the java app with

    ./gradlew run

Note: the Oracle JDBC drivers are not redistributable
