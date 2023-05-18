#!/bin/bash

# Following instructions at https://ubuntu.com/blog/launch-ubuntu-22-04-desktop-on-google-cloud

# Set autoservice restart for the script
sudo cp /etc/needrestart/needrestart.conf /etc/needrestart/needrestart.conf.backup
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf

sudo apt-get -y --assume-yes -qq update
sudo apt-get -y --assume-yes -qq upgrade
sudo apt-get -y --assume-yes -qq install ubuntu-desktop
sudo apt-get remove --auto-remove gdm3 
sudo apt-get -y --assume-yes -qq  install slim
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt-get -y install --assume-yes ./chrome-remote-desktop_current_amd64.deb
rm ./chrome-remote-desktop_current_amd64.deb

#Restore autoservice restart config
sudo echo /etc/needrestart/needrestart.conf.backup > /etc/needrestart/needrestart.conf
sudo rm /etc/needrestart/needrestart.conf.backup 


# Now the systems needs to reboot
read -t 60 -p "The system needs to reboot. Press anykey to inmediate reboot. Otherwise, it will reboot in 60 senconds"
sudo reboot
