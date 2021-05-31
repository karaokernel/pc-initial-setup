#!/bin/bash

#configuration script for itscampa's computers

#set second monitor to mirror primary laptop display
#need to change the names of the displays first (list them with command "xrandr")
echo "xrandr --output HDMI-1-0 --same-as eDP-1" >> /home/$USER/.xinitrc

#set tab autocomplete to ignore case
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc

#alt tab only between current desktop windows
gsettings set org.gnome.shell.app-switcher current-workspace-only true

#al tab between windows and not applications
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab', '<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward  "['<Alt><Shift>Tab', '<Super><Shift>Tab']"

#install albert
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt install albert

#gnome extensions:
#https://extensions.gnome.org/extension/906/sound-output-device-chooser/
#https://extensions.gnome.org/extension/36/lock-keys/
#https://extensions.gnome.org/extension/779/clipboard-indicator/
#https://extensions.gnome.org/extension/444/cpu-freq/
#https://extensions.gnome.org/extension/945/cpu-power-manager/
#https://extensions.gnome.org/extension/7/removable-drive-menu/
#https://extensions.gnome.org/extension/800/remove-dropdown-arrows/
#https://extensions.gnome.org/extension/1403/remove-alttab-delay/
#https://extensions.gnome.org/extension/1482/remove-audio-device-selection-dialog/

#looks:
#https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/

#install bluetooth manager
apt-get -y install blueman

# install tlp and powertop for battery management
#apt-get -y install tlp
#apt-get -y install powertop

#generate ssh keys (make sure you can use ssh-keygen)
#should ask prompt to ask for pc name to give to key
ssh-keygen -a 100 -t ed25519 -f ~/.ssh/id_ed25519 #-C "CHANGE THIS"
