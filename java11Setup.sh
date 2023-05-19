#!/bin/bash

sudo apt-get -y --assume-yes -qqq update
sudo apt-get -y --assume-yes -qq install openjdk-11-jre-headless

# Set JAVA_HOME for all users.

echo "export JAVA_HOME=\$(readlink -f /usr/bin/java | sed \"s:/bin/java::\")" > jdk_home.sh
sudo chown root jdk_home.sh
sudo mv jdk_home.sh /etc/profile.d/jdk_home.sh

# Load JAVA_HOME right now
source /etc/profile.d/jdk_home.sh

echo "Done. JAVA_HOME set to $JAVA_HOME"
