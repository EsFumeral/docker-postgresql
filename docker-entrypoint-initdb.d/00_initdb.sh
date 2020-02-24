#!/bin/bash

source /docker-entrypoint-initdb.d/scripts/00-setenv.sh
source /docker-entrypoint-initdb.d/scripts/11-create-tablespace-folder.sh
source /docker-entrypoint-initdb.d/scripts/21-create-database.sh
source /docker-entrypoint-initdb.d/scripts/22-create-schema.sh

cd /