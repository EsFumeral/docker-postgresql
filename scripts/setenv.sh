#!/bin/bash

echo ""
echo setenv.sh started
echo ""

CODAPP=codapp
APP=app
BDPASSAPP=codapp
BDPORTAPP=5432

remaining=4

for i in "$@"
do
case $i in
    -codapp=*|--codapp=*)
    LOAD_CODAPP="${i#*=}"
    let "remaining--"
    shift # past argument=value
    ;;
    -app=*|--app=*)
    LOAD_APP="${i#*=}"
    let "remaining--"
    shift # past argument=value
    ;;
    -pass=*|--password=*)
    LOAD_BDPASSAPP="${i#*=}"
    let "remaining--"
    shift # past argument=value
    ;;
    -p=*|--port=*)
    LOAD_BDPORTAPP="${i#*=}"
    let "remaining--"
    shift # past argument=value
    ;;
    *)
          # unknown option
    ;;
esac
done

if [[ remaining -eq 0 ]]; then
    export LOAD_PARAM=true
    echo Load params $LOAD_PARAM
    echo Setting CODAPP to $LOAD_CODAPP
    CODAPP=$LOAD_CODAPP
    echo Setting APP to $LOAD_CODAPP
    APP=$LOAD_APP
    echo Setting BDPORTAPP to $LOAD_BDPORTAPP
    BDPORTAPP=$LOAD_BDPORTAPP
    echo Setting BDPASSAPP to $LOAD_BDPASSAPP
    BDPASSAPP=$LOAD_BDPASSAPP
else
    echo Loading default values
fi

export CODAPP
export APP
export BDPASSAPP
export BDPORTAPP


export LONG_APP_NAME=$CODAPP
export SHORT_APP_NAME=$APP
export DB_PORT=$BDPORTAPP
export PG_PASSWORD=$BDPASSAPP
export DATA_PATH=/app/docker/postgresql/$LONG_APP_NAME/data
export TABLESPACE_PATH=$DATA_PATH/tablespaces
export PGTABLESPACES=/var/lib/postgresql/data/tablespaces
export GIT_URL=https://github.com/gdeignacio/docker-postgresql.git
export FOLDER_NAME=docker-postgresql
export VERSION=9.5-alpine