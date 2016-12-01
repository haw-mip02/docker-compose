#!/bin/bash

# Author: Erik Kristensen
# Email: erik@erikkristensen.com
# License: MIT
# Nagios Usage: check_nrpe!check_docker_container!_container_id_
# Usage: ./check_docker_container.sh _container_id_
#
# The script checks if a container is running.
#   OK - running
#   WARNING - container is ghosted
#   CRITICAL - container is stopped
#   UNKNOWN - does not exist

CONTAINER=$1
SERVER=$(cat ../hostname.txt)
RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

if [ $? -eq 1 ]; then
  echo "$SERVER: UNKNOWN - $CONTAINER does not exist." | ./slacktee.sh
  exit 3
fi

if [ "$RUNNING" == "false" ]; then
  echo "$SERVER: CRITICAL - $CONTAINER is not running." | ./slacktee.sh
  exit 2
fi

GHOST=$(docker inspect --format="{{ .State.Ghost }}" $CONTAINER)

if [ "$GHOST" == "true" ]; then
  echo "$SERVER: WARNING - $CONTAINER has been ghosted." | ./slacktee.sh
  exit 1
fi

STARTED=$(docker inspect --format="{{ .State.StartedAt }}" $CONTAINER)
NETWORK=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $CONTAINER)

echo "$SERVER: OK - $CONTAINER is running. IP: $NETWORK, StartedAt: $STARTED" 

exit 0
