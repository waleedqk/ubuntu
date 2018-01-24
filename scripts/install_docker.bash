#!/bin/bash

set -e


# Uninstall old versions

sudo apt-get remove docker docker-engine docker.io



# Install using the repository

sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# verify fingerprint
sudo apt-key fingerprint 0EBFCD88

# set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# INSTALL DOCKER CE
sudo apt-get update
sudo apt-get install docker-ce
# sudo apt-get install docker-ce=<VERSION>

# add current user to docker group
sudo usermod -aG docker $USER

# test docker ce is installed correctly 
sudo docker run hello-world

## SYSTEMD
# sudo systemctl enable docker
# sudo systemctl disable docker
