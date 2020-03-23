#!/bin/bash

# WARNING
# All your data will be LOST
# Run this script only for development
# or first go into production

echo ""
echo build_and_run_container.sh started
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
sudo rm -r /app/docker/postgresql/$LONG_APP_NAME
mkdir -p $HOME/.docker-utils
cd $HOME/.docker-utils
echo Current dir should be $HOME/.docker-utils
echo Current dir is `pwd`
echo `pwd` contains
ls -l
echo Removing $FOLDER_NAME from `pwd`
sudo rm -r $HOME/.docker-utils/$FOLDER_NAME
ls -l
git clone $GIT_URL
echo Cloning from git
cd $HOME/.docker-utils/$FOLDER_NAME

echo Building images at `pwd`
sudo docker build -t "postgres:$LONG_APP_NAME" --file ./$VERSION/Dockerfile .

echo Scripts folder `pwd`/scripts
sudo chmod +x ./scripts/*

echo Creating $DATA_PATH folder
sudo mkdir -p $DATA_PATH
ls -l $DATA_PATH/..
sudo docker stop pg-docker-$LONG_APP_NAME
./scripts/run-container.sh
