#!/bin/bash

sudo wget --output-document=/usr/share/backgrounds/fedora-workstation/now2y.jpg https://i.pinimg.com/originals/3b/8a/d2/3b8ad2c7b1be2caf24321c852103598a.jpg
sudo wget --output-document=/home/$USER/.config/gconf/dconf.ini https://raw.githubusercontent.com/ShogoXY/kickstart_fedora/main/dconf.ini

dconf load / < /home/$USER/.config/gconf/dconf.ini
