#!/bin/bash

# WARNING
# All your data will be LOST
# Run this script only for development
# or first go into production

echo ""
echo fresh_build_and_run.sh started
echo ""

source ./setenv.sh

echo LONG_APP_NAME $LONG_APP_NAME
echo SHORT_APP_NAME $SHORT_APP_NAME
echo BD_PORT $DB_PORT
echo PG_PASSWORD $PG_PASSWORD
echo DATA_PATH $DATA_PATH
echo TABLESPACE_PATH $TABLESPACE_PATH
echo PGTABLESPACES $PGTABLESPACES
echo GIT_URL $GIT_URL
echo FOLDER_NAME $FOLDER_NAME
echo VERSION $VERSION

# Don't optimize with $DATA_PATH
# It could be empty and all data will be lost
echo Deleting /app/docker/postgresql/$LONG_APP_NAME
sudo rm -r /app/docker/postgresql/$LONG_APP_NAME

CURDIR=`pwd`
echo Current dir CURDIR is $CURDIR
echo Folder CURDIR $CURDIR contains
ls -l

echo Changing directory to $CURDIR/..
cd $CURDIR/..
echo Building images at `pwd`
echo content `ls .`
echo Dockerfile path ./$VERSION/Dockerfile
sudo docker build -t "postgres:$LONG_APP_NAME" --file ./$VERSION/Dockerfile .

echo Scripts folder `pwd`/scripts
# sudo chmod +x ./scripts/*

echo Creating $DATA_PATH folder
sudo mkdir -p $DATA_PATH
ls -l $DATA_PATH/..
sudo docker stop pg-docker-$LONG_APP_NAME
./scripts/run-container.sh
