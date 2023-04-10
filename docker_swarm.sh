#!bin/bash

sudo apt update
sudo apt install docker.io docker-compose

# intialize docker swarm in manager mode
sudo docker swarm init  --advertise-addr <manager-public-ip>

sudo docker service create --name registry --publish published=5000,target=5000 registry:2

# for worker node
sudo docker swarm join --token <auth-token> <ip>:<port>

# before deploying the service you need to find the regitrsty to distribute docker images
# we are using gcp container registry
# first run the container and check if the container are running or not
# then tag it according to the registry
# then push it to the respoective registry
docker-compose push
sudo docker stack deploy --compose-file=path-to-compose-file