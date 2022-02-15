#!/bin/bash

wget https://raw.githubusercontent.com/ShogoXY/fedora/main/.dnfinstall

echo alias dnfinstall="bash ~/.dnfinstall" >> ~/.bashrc

source ~/.bashrc
