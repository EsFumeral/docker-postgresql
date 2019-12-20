#!/bin/bash

#docker exec -i -t [CONTAINER_NAME] /bin/bash

echo ""
echo run-container.sh started
echo ""

#source ./setenv.sh

echo LONG_APP_NAME $LONG_APP_NAME
echo SHORT_APP_NAME $SHORT_APP_NAME
echo BD_PORT $DB_PORT
echo PG_PASSWORD $PG_PASSWORD
echo DATA_PATH $DATA_PATH
echo TABLESPACE_PATH $TABLESPACE_PATH
echo PGTABLESPACES $PGTABLESPACES

sudo docker run --rm \
    --name pg-docker-$LONG_APP_NAME \
    -e POSTGRES_PASSWORD=$PG_PASSWORD \
    -e LONG_APP_NAME=$LONG_APP_NAME \
    -d -p $DB_PORT:5432 \
    -v $DATA_PATH:/var/lib/postgresql/data \
    postgres:$LONG_APP_NAME

echo pg-docker-$LONG_APP_NAME succesfully created