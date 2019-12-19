#!/bin/bash

#sudo docker pull postgres
sudo docker build -t "postgres:$LONG_APP_NAME" .