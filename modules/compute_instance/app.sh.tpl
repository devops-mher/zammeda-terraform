#!/usr/bin/env bash

sudo apt-get update 
sudo apt install openssh-server
sudo service ssh start
sudo apt install git -y
sudo curl -L https://omnitruck.chef.io/install.sh | sudo bash
sudo apt install apt-transport-https -y ca-certificates curl gnupg2 software-properties-common
uname --all; sudo grep docker /etc/apt/sources.list; sudo apt-get install docker-ce -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo apt install git -y
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

docker network create proxy_2_apps
https://github.com/devops-mher/zammad-docker-compose.git
cd zammad-docker-compose
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
