#!/bin/bash

SYS=` cat /etc/*-release 2> /dev/null | grep PRETTY_NAME `
de=$(echo $DESKTOP_SESSION)


if [[ $SYS =~ "Debian" ]]; then

    sudo apt-get update -y
    sudo apt-get install gphoto2 v4l2loopback-utils v4l2loopback-dkms ffmpeg

elif [[ $SYS =~ "Fedora" ]]; then
    sudo dnf update -y
    sudo dnf install gphoto2 v4l2loopback ffmpeg
 fi
     

#sudo apt-get install gphoto2 v4l2loopback-utils v4l2loopback-dkms ffmpeg
#sudo dnf install gphoto2 v4l2loopback ffmpeg

# Rzeczy potrzebne do DSLR dla CANONA

#sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2
#sudo echo "dslr-webcam" >> /etc/modules
#sudo touch /etc/modprobe.d/dslr-webcam.conf
#sudo printf "# Module options for Video4Linux, needed for our DSLR Webcam
#alias dslr-webcam v4l2loopback
#options v4l2loopback exclusive_caps=1 max_buffers=2" >> /etc/modprobe.d/dslr-webcam.conf

# Automatic connection
sudo touch /etc/udev/rules.d/99-usb-script.rules
echo "ACTION==\"add\", SUBSYSTEM==\"usb\", ATTR{idVendor}==\"04b0\", ATTR{idProduct}==\"0448\", RUN+=\"gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0 \" " | sudo tee /etc/udev/rules.d/99-usb-script.rules > /dev/null



echo "alias nikon='gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0'" >> ~/.bashrc
source ~/.bashrc
