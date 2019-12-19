#!/bin/bash

#sudo mkdir -p $DATA_PATH
sudo docker stop pg-docker-$LONG_APP_NAME
sudo docker run --rm \
    --name pg-docker-$LONG_APP_NAME \
    -e POSTGRES_PASSWORD=$PG_PASSWORD \
    -e LONG_APP_NAME=$LONG_APP_NAME \
    -d -p $DB_PORT:5432 \
    -v $DATA_PATH:/var/lib/postgresql/data \
    postgres:$LONG_APP_NAME

