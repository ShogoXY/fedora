#!/bin/bash


if [[ $SYS =~ "Debian" ]]; then
VAR=apt
sudo VAR install git vim -y
sudo VAR install build-essential cmake vim-nox python3-dev -y

elif [[ $SYS =~ "Fedora" ]]; then
VAR=dnf
sudo VAR install git vim -y
sudo VAR install cmake gcc-c++ make python3-devel -y 


sudo wget --output-document=/home/$USER/.vimrc https://raw.githubusercontent.com/ShogoXY/fedora/main/.vimrc_2 -y

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim -y

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
vim +PluginInstall +qall
