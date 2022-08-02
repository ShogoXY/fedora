#!/bin/bash

wget https://raw.githubusercontent.com/ShogoXY/fedora/main/.dnfinstall
sudo dnf install fzf -y

echo 'alias dnfinstall="bash ~/.dnfinstall"' >> ~/.bashrc


#echo "alias canon='gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0' " >> ~/.bashrc


source ~/.bashrc
