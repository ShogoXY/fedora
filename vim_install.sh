#!/bin/bash

SYS=` cat /etc/*-release 2> /dev/null | grep PRETTY_NAME `

if [[ $SYS =~ "Debian" ]]; then
VAR=apt
sudo $VAR update -y
sudo $VAR install git vim -y
sudo $VAR install build-essential cmake vim-nox python3-dev -y

elif [[ $SYS =~ "Fedora" ]]; then
VAR=dnf
sudo $VAR install git vim -y
sudo $VAR install cmake gcc-c++ make python3-devel -y 
fi
mkdir ~/.vim/spell
cd ~/.vim/spell
wget http://ftp.vim.org/vim/runtime/spell/pl.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/pl.iso-8859-2.spl
cd 
wget --output-document=/home/$USER/.vimrc https://raw.githubusercontent.com/ShogoXY/fedora/main/.vimrc_3

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe/;python3 install.py --all
mkdir ~/.vim/spell
cd ~/.vim/spell
wget http://ftp.vim.org/vim/runtime/spell/pl.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/pl.iso-8859-2.spl
cd 

wget --output-document=/home/$USER/.vimrc https://raw.githubusercontent.com/ShogoXY/fedora/main/.vimrc_2
cd
cd ~;vim .vimrc
