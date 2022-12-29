#! /bin/bash

sudo docker ps
echo ""
echo "Enter the Container ID to connect to"
read Container

sudo docker exec -it $Container /bin/bash
