#!/bin/bash

wget https://raw.githubusercontent.com/ShogoXY/fedora/main/.dnfinstall.sh

echo \alias dnfinstall=sh ~/.dnfinstall >> ~/.bashrc

source ~/.bashrc
