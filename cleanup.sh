#!/bin/bash
echo "Killing docker if it still runnung."
sudo pkill docker

echo "Start removing all container in  docker."
sudo docker rm $(sudo docker ps -a -q)

echo "Start removing  all images in docker."
sudo docker rmi $(sudo docker images -q)

echo "Successfull cleanup."
