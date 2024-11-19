#!/bin/bash

# Arguments: $1 = s, $2 = , $3 = , $4 = ,$5 = 
SQL_FILE=$1 # sql file to run
DATABASE_NAME=$2 # database name
USERNAME=$3 # username (to create role and connect)
PASSWORD=$4 # password
USE_EXISTING_DATA=$5 # type yes if database/data already created and type anything else or leave empty to create the data

TEMP_SQL_FILE="temp.sql"
if [ "$USE_EXISTING_DATA" != "yes" ]; then

    sed -e "s/:database_name/$DATABASE_NAME/g" -e "s/:username/$USERNAME/g" -e "s/:password/$PASSWORD/g" "./system_init.sql" > "./$TEMP_SQL_FILE"
    # RUN system_init.sql with postgres or any master user as it creates the required role and database
    sudo -u postgres psql -f "./$TEMP_SQL_FILE"
    
    
    sed -e "s/:database_name/$DATABASE_NAME/g" "./enitites_create.sql" > "./$TEMP_SQL_FILE"
    # RUN enitites_create.sql with passed username and password
    PGPASSWORD="$PASSWORD" psql -U $USERNAME -d $DATABASE_NAME  -h localhost -f "./$TEMP_SQL_FILE"
fi

# Replace each param (database name for now) in sql file with the following
sed -e "s/:database_name/$DATABASE_NAME/g" "./$SQL_FILE" > "./$TEMP_SQL_FILE"

PGPASSWORD="$PASSWORD" psql -U $USERNAME -d $DATABASE_NAME  -h localhost -f "./$TEMP_SQL_FILE"

# Delete temp script  file
rm "./$TEMP_SQL_FILE"
