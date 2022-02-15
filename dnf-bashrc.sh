#!/bin/bash

wget https://raw.githubusercontent.com/ShogoXY/fedora/main/.dnfinstall
sudo dnf install fzf -y

echo alias dnfinstall=\"bash ~/.dnfinstall\" >> ~/.bashrc

source ~/.bashrc
