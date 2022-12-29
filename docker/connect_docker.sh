#! /bin/bash

echo "Please copy a Container ID"
sudo docker ps
echo ""
read = Container

sudo docker exec -it $Container /bin/bash
