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

#checking container to be exited
./check_docker_container.sh dockercompose_data-acquisition_1
if (test $? -ne 0)
	then docker rm dockercompose_data-acquisition_1
fi
#./check_docker_container.sh dockercompose_frontend_1
#if (test $? -ne 0)
#       then docker rm dockercompose_frontend_1
#fi
./check_docker_container.sh dockercompose_data_management_1
if (test $? -ne 0)
        then docker rm dockercompose_data_management_1
fi
./check_docker_container.sh dockercompose_analysis-rest_1
if (test $? -ne 0)
        then docker rm dockercompose_analysis-rest_1
fi
./check_docker_container.sh dockercompose_analysis-preprocess_1
if (test $? -ne 0)
        then docker rm dockercompose_analysis-preprocess_1
fi
./check_docker_container.sh dockercompose_analysis-database_1
if (test $? -ne 0)
        then docker rm dockercompose_analysis-database_1
fi
./check_docker_container.sh dockercompose_analysis-query-test_1
if (test $? -ne 0)
        then docker rm dockercompose_analysis-query-test_1
fi
./check_docker_container.sh dockercompose_watchtower_1
if (test $? -ne 0)
        then docker rm dockercompose_watchtower_1
fi
./check_docker_container.sh dockercompose_analysis-cache_1
if (test $? -ne 0)
        then docker rm dockercompose_analysis-cache_1
fi

docker-compose up -d

