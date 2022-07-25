#!/bin/bash

sudo apt-get install gphoto2 v4l2loopback-utils v4l2loopback-dkms ffmpeg
#sudo dnf install gphoto2 v4l2loopback ffmpeg

sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2
sudo echo "dslr-webcam" >> /etc/modules
sudo printf "# Module options for Video4Linux, needed for our DSLR Webcam
alias dslr-webcam v4l2loopback
options v4l2loopback exclusive_caps=1 max_buffers=2" >> /etc/modprobe.d/dslr-webcam.conf


echo "alias canon='gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0'" >> ~/.bashrc
