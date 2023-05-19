#!/bin/bash

# Following instruction in https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/

sudo apt-get -y --assume-yes -qq install gnupg

curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
   --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

sudo apt-get -y --assume-yes -qqq update
sudo apt-get install -y --assume-yes -qq mongodb-org

# Start MongoDB
sudo systemctl start mongod
sudo systemctl enable mongod

echo "Done. Excetute \"sudo systemctl status mongod\" to check MongoDB status".
echo "You can also check MongoDB by conection with mongosh and sending the folloqing query: \" db.stats()\"."
