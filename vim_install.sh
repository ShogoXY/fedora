#!/bin/bash

wget https://raw.githubusercontent.com/ShogoXY/fedora/main/.vimrc

sudo bash -c `\
apt install vim vim-gui-common -y
apt install build-essential cmake vim-nox python3-dev -y
\`
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
