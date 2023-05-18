#!/bin/bash

# Following instructions at https://ubuntu.com/blog/launch-ubuntu-22-04-desktop-on-google-cloud

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install slim
sudo apt -y install ubuntu-desktop
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt-get -y install --assume-yes ./chrome-remote-desktop_current_amd64.deb
rm ./chrome-remote-desktop_current_amd64.deb

# Now the systems needs to reboot
read -t 60 -p "The system needs to reboot. Press anykey to inmediate reboot. Otherwise, it will reboot in 60 senconds"