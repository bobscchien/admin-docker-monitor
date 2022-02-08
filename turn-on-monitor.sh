#!/bin/bash

####################################################################
# For the very first time, the scritp will search the LOCALHOST_DIR.
# If the directory is empty, then do "airflow db init" command.
####################################################################

### Build docker-compose

source ./config/conf.ini

# Preparation
cd bin && bash network-builder.sh && cd ..

sudo mkdir -p $DIR_LOCAL_GRAFANA \
              $DIR_LOCAL_PROMETH \
              $DIR_LOCAL_METRICS \
              $DIR_LOCAL_ALERTMANAGER
sudo chown -R $USER_NAME:$USER_NAME $DIR_LOCAL_GRAFANA
sudo chown -R $USER_NAME:$USER_NAME $DIR_LOCAL_PROMETH
sudo chown -R $USER_NAME:$USER_NAME $DIR_LOCAL_METRICS
sudo chown -R $USER_NAME:$USER_NAME $DIR_LOCAL_ALERTMANAGER

# Start the service
docker-compose build --force-rm --no-cache
docker-compose up -d
