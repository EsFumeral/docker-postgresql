#!/bin/bash

set -e

psql \
    -v ON_ERROR_STOP=1 \
    --u $POSTGRES_USER \
    --d $POSTGRES_DB \
    -f /docker-entrypoint-initdb.d/sql/create_database.sql \
    --echo-all \
    --set AUTOCOMMIT=off \
    --set ON_ERROR_STOP=on \
    --set APP_DATABASE_NAME=$APP_DATABASE_NAME \
    --set APP_USER_NAME=$APP_USER_NAME \
    --set APP_WWW_USER_NAME=$APP_WWW_USER_NAME \
    --set APP_TABLESPACES=$APP_TABLESPACES \
    --set LC_NAME=$LC_NAME
    
psql_exit_status = $?

if [ $psql_exit_status != 0 ]; then
    echo "psql failed while trying to run this sql script" 1>&2
    exit $psql_exit_status
fi

echo "sql script successful"
exit 0



# set -e

# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    
#     CREATE DATABASE $APP_DATABASE_NAME
#         WITH OWNER = postgres
#         ENCODING = 'UTF8'
#         TABLESPACE = pg_default
#         LC_COLLATE = '$LC_NAME'
#         LC_CTYPE = '$LC_NAME'
#         CONNECTION LIMIT = -1;

#     ALTER DATABASE $APP_DATABASE_NAME SET client_encoding='UTF8';

#     CREATE ROLE $APP_USER_NAME LOGIN
#     ENCRYPTED PASSWORD '$APP_USER_NAME'
#     NOSUPERUSER NOINHERIT NOCREATEDB NOCREATEROLE;

#     CREATE ROLE $APP_WWW_USER_NAME LOGIN
#     ENCRYPTED PASSWORD '$APP_WWW_USER_NAME'
#     NOSUPERUSER NOINHERIT NOCREATEDB NOCREATEROLE;

#     CREATE TABLESPACE $APP_DATABASE_NAME
#     owner $APP_USER_NAME
#     LOCATION '$APP_TABLESPACES';
   
#     ALTER ROLE $APP_USER_NAME set default_tablespace=$APP_DATABASE_NAME;

#     ALTER DATABASE $APP_DATABASE_NAME OWNER to $APP_USER_NAME;

# EOSQL