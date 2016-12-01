#! /bin/bash

# Author: Mikko Eberhardt
# Email: mikko.eberhardt@haw-hamburg.de


# CRON script updating docker compose 

#pulling git repository
git pull

#pulling new images from docker hub
docker-compose pull

#docker-compose up new to restart new container
docker-compose up -d

#make scripts for container checking executable
chmod +x check_docker_container.sh slacktee.sh

#checking container to be exited
./check_docker_container.sh dockercompose_data-acquisition_1
./check_docker_container.sh dockercompose_frontend_1
./check_docker_container.sh dockercompose_data_management_1
./check_docker_container.sh dockercompose_analysis-rest_1
./check_docker_container.sh dockercompose_analysis-preprocess_1
./check_docker_container.sh dockercompose_analysis-database_1
./check_docker_container.sh dockercompose_analysis-query-test_1
./check_docker_container.sh dockercompose_watchtower_1
./check_docker_container.sh dockercompose_analysis-cache_1
