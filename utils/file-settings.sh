#!/bin/bash

cd $PGDATA
mkdir tablespaces
chown -R postgres:postgres tablespaces
chmod 777 tablespaces
