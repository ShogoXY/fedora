#!/bin/bash

sudo wget --output-document=/usr/share/backgrounds/fedora-workstation/now2y.jpg https://i.pinimg.com/originals/3b/8a/d2/3b8ad2c7b1be2caf24321c852103598a.jpg
sudo wget --output-document=/home/$USER/.config/gconf/dconf.ini https://raw.githubusercontent.com/ShogoXY/kickstart_fedora/main/dconf.ini

sudo dconf load / < /home/$USER/.config/gconf/dconf.ini

sudo echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
sudo echo "fastestmirror=1" >> /etc/dnf/dnf.conf
sudo systemctl disable NetworkManager-wait-online.service
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo tlp start
sudo flatpak -y install spotify
