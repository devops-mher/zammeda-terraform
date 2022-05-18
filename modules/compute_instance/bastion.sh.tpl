#!/usr/bin/env bash

sudo apt-get update 
sudo apt install openssh-server
sudo service ssh start
sudo apt install git -y
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt install ansible
sudo apt update
sudo apt install puppetserver -y
wget https://packages.chef.io/files/stable/chef-workstation/21.10.640/ubuntu/20.04/chef-workstation_21.10.640-1_amd64.deb
sudo dpkg -i chef-workstation_21.10.640-1_amd64.deb
