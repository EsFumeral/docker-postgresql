#!/bin/bash

source ./setenv.sh
sudo docker exec -i -t pg-docker-$LONG_APP_NAME /bin/bash
