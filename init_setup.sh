#!/bin/bash

#configuration script for itscampa's computers

#set second monitor to mirror primary laptop display
#need to change the names of the displays first (list them with command "xrandr")
echo "xrandr --output HDMI-1-0 --same-as eDP-1" >> /home/$USER/.xinitrc

#set tab autocomplete to ignore case
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc

#alt tab only between current desktop windows
gsettings set org.gnome.shell.app-switcher current-workspace-only true

#install bluetooth manager
apt-get -y install blueman

# install tlp and powertop for battery management
apt-get -y install tlp
apt-get -y install powertop

#generate ssh keys (make sure you can use ssh-keygen)
#should ask prompt to ask for pc name to give to key
ssh-keygen -a 100 -t ed25519 -f ~/.ssh/id_ed25519 #-C "CHANGE THIS"
