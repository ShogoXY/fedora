#!/bin/bash

https://github.com/ShogoXY/fedora/blob/30db9596419fb25eee3cf50115bda21879f767ae/.vimrc
sudo bash -c `\
apt install vim vim-gui-common -y
apt install build-essential cmake vim-nox python3-dev -y
\`
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
