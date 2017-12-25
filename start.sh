#!/bin/bash

# run mysql db in new container called films-mysql-db
cd mysql/
./docker-run.sh

# run films-service api in new container called films-service
cd ../cd films-service-mysql/
./docker-run.sh
