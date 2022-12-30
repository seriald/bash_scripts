#!/bin/bash

echo "Deploying Portainer Agent"
sudo docker run -d   -p 9001:9001   --name portainer_agent_docks.vitori.org   --restart=always   -v /var/run/docker.sock:/var/run/docker.sock   portainer/agent:latest
echo ""
echo "Deploying Watch Tower"
sudo docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower
