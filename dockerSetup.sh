#!/bin/bash

# Following instructions in https://docs.docker.com/engine/install/ubuntu/

sudo apt-get -y --assume-yes -qq remove docker docker-engine docker.io containerd runc

sudo apt-get -y --assume-yes -qqq update
sudo apt-get -y --assume-yes -qq install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get -y --assume-yes -qqq update
sudo apt-get -y --assume-yes -qq install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Done. Excetute \"sudo docker run hello-world\" to check Docker instalation."
