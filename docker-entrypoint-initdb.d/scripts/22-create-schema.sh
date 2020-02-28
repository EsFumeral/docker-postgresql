#!/bin/bash

# set -e

# psql \
#     --username $POSTGRES_USER \
#     --dbname $POSTGRES_DB \
#     --file /docker-entrypoint-initdb.d/sql/create_schema.sql \
#     --echo-all \
#     --set AUTOCOMMIT=off \
#         ON_ERROR_STOP=on \
#         APP_DATABASE_NAME=$APP_DATABASE_NAME \
#         APP_USER_NAME=$APP_USER_NAME \
#         APP_WWW_USER_NAME=$APP_WWW_USER_NAME
    
#psql_exit_status = $?

#if [ $psql_exit_status != 0 ]; then
#    echo "psql failed while trying to run this sql script" 1>&2
#    exit $psql_exit_status
#fi

#echo "sql script successful"
#exit 0



set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$LONG_APP_NAME" <<-EOSQL
    
    CREATE SCHEMA $APP_DATABASE_NAME AUTHORIZATION $APP_USER_NAME;

    GRANT USAGE ON SCHEMA $APP_DATABASE_NAME to $APP_WWW_USER_NAME;
    
    ALTER ROLE $APP_WWW_USER_NAME SET search_path=$APP_DATABASE_NAME;

EOSQL