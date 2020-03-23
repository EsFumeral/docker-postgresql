#!/bin/bash

echo ""
echo setenv.sh started
echo ""

export CODAPP=codapp
export APP=app
export BDPASSAPP=codapp
export BDPORTAPP=5435

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