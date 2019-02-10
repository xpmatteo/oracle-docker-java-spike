
Example of how to 

  * run an Oracle DB in docker, 
  * automatically create an application user and a test user 
  * automatically create the database schema in the app and test databases
  * connect to it in a Java program.

Run oracle with

    script/oracle-run.sh

Create the local databases with:

    script/create-local-databases.sh

Run the java app with

    ./gradlew run

Note: the Oracle JDBC drivers are not redistributable
