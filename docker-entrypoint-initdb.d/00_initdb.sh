#!/bin/bash

source /docker-entrypoint-initdb.d/initdb.d/00-setenv.sh
source /docker-entrypoint-initdb.d/initdb.d/11-create-tablespace-folder.sh
source /docker-entrypoint-initdb.d/initdb.d/21-create-database.sh
source /docker-entrypoint-initdb.d/initdb.d/22-create-schema.sh

cd /