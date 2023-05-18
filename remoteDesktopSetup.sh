#!/bin/bash

# Following instructions at https://ubuntu.com/blog/launch-ubuntu-22-04-desktop-on-google-cloud

# Set autoservice restart for the script
sudo cp /etc/needrestart/needrestart.conf /etc/needrestart/needrestart.conf.backup
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf

sudo apt-get -y --assume-yes -qqq update
sudo apt-get -y --assume-yes -qqq upgrade
sudo apt-get -y --assume-yes -qq install ubuntu-desktop gnome-software firefox
#sudo apt-get -y --assume-yes -qq remove --auto-remove gdm3 thunderbird
#sudo apt-get -y --assume-yes -qq  install slim gnome-software firefox
sudo wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt-get -y install --assume-yes -qqq ./chrome-remote-desktop_current_amd64.deb
sudo rm ./chrome-remote-desktop_current_amd64.deb

#Restore autoservice restart config
sudo mv -f /etc/needrestart/needrestart.conf.backup /etc/needrestart/needrestart.conf


# Now the systems needs to reboot
read -t 60 -p "The system needs to reboot. Press anykey to inmediate reboot. Otherwise, it will reboot in 60 senconds"
sudo reboot
