# LetsGetChecked

In this project, there is a Java file called the **Main.java**, which loads all the csv file from 
the source folder to Snowflake schema. But before the data is loaded, the environment is to be created, 
which is done by running the `sql` queries in **ENV.sql**, **PIPES.sql**, **TABLES.sql**.

**ENV.sql** - This file creates the warehouse, database, staging area and the file formats for the file received.

**PIPES.sql** -  This file creates pipes which makes sure of loading data from staging area into the snowflake wareshouse.

**TABLES.sql** - This file contains all the metadata for the dim and fact tables to be created in the warehouse.

*Then we have the java file* :-

**Main.java** - Since, the file was stored in my laptop, with the help of the JDBC driver provided by snowflake,
we are uploading the file in the staging area and then refreshing the pipe to that file. 

*Note* :- Since the file was stored in my laptop, this jdbc is used to upload data in the staging area. Had the source files been stored in AWS S3 bucket, we just had to create the stage linking to that bucket and execute the command given below :-

`ALTER PIPE <PIPE_NAME> REFRESH`;

The pipe itself would keep track of the historical files, making sure duplicate files are not reloaded.

## Queries

**QUERIES.sql** - This file contains some queries which uses the fact and dimension tables 
