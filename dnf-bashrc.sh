#!/bin/bash

wget https://raw.githubusercontent.com/ShogoXY/fedora/main/.dnfinstall.sh

echo \alias dnfinstall=bash ~/.dnfinstall.sh >> ~/.bashrc

source ~/.bashrc
