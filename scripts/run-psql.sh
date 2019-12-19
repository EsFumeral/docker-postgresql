#!/bin/bash

sudo docker run -it --rm --name psql-$LONG_APP_NAME --link pg-docker-$LONG_APP_NAME:postgres postgres psql -h postgres -U postgres