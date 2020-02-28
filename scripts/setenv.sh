#!/bin/bash

export LONG_APP_NAME=portafib
export SHORT_APP_NAME=pfi
export DB_PORT=5435
export PG_PASSWORD=portafib
export DATA_PATH=/app/docker/postgresql/$LONG_APP_NAME/data
export TABLESPACE_PATH=$DATA_PATH/tablespaces
export PGTABLESPACES=/var/lib/postgresql/data/tablespaces
export GIT_URL=https://github.com/gdeignacio/docker-postgresql.git
export FOLDER_NAME=docker-postgresql
export VERSION=12-alpine