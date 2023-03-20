#!bin/bash

sudo apt update
sudo apt install docker.io docker-compose

# intialize docker swarm in manager mode
sudo docker swarm init  --advertise-addr <manager-public-ip>
sudo docker service create --name registry --publish published=5000,target=5000 registry:2

# for worker node
sudo docker swarm join --token <auth-token> <ip>:<port>