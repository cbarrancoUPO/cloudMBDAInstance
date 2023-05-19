#!/bin/bash

#sudo apt-get -y --assume-yes -qqq update
#sudo apt-get -y --assume-yes -qqq upgrade
sudo apt-get -y --assume-yes -qq install openjdk-8-jre-headless

# Set JAVA_HOME for all users.

sudo cat<<EOF > /etc/profile.d/jdk_home.sh
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
EOF

# Load JAVA_HOME right now
source /etc/profile.d/jdk_home.sh
