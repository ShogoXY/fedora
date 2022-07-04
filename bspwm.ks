#version=F36

# URLs and REPOs



url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-36&arch=x86_64"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f36&arch=x86_64" --cost=0



# RPMFusion Free
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-36&arch=x86_64" --includepkgs=rpmfusion-free-release
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-36&arch=x86_64" --cost=0
repo --name=rpmfusion-free-tainted --mirrorlist="https://mirrors.rpmfusion.org/metalink?repo=free-fedora-tainted-36&arch=x86_64"

# RPMFusion NonFree
repo --name=rpmfusion-nonfree --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-36&arch=x86_64" --includepkgs=rpmfusion-nonfree-release
repo --name=rpmfusion-nonfree-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-36&arch=x86_64" --cost=0
repo --name=rpmfusion-nonfree-tainted --mirrorlist="https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-tainted-36&arch=x86_64"

# Negativo17 NVIDIA/CUDA
#repo --name=negativo17 --baseurl="https://negativo17.org/repos/nvidia/fedora-36/x86_64/"
# Secure Messenger
#repo --name=keybase --baseurl="http://prerelease.keybase.io/rpm/x86_64"
#repo --name=element --baseurl="https://download.copr.fedorainfracloud.org/results/taw/element/fedora-36-x86_64/"



# Use graphical install
graphical
############################# Keyboard layouts
keyboard --xlayouts='pl'
############################# System language
lang pl_PL.UTF-8




%packages


@Fedora Workstation
################################################################
@^custom-environment
@standard
@networkmanager-submodules
@window-manager
vim
git
feh
bspwm
lightdm
@base-x
picom
sxhkd
xsetroot
polybar
kitty
rofi
lxpolkit
thunar
firefox
pip
mirage
curl
unzip
dunst
arandr
tar
gzip
gcc
g++
flatpak
lxappearance
breeze-cursor-theme
papirus-icon-theme
arc-theme
xdg-utils
xdg-user-dirs
neovim 
python3-neovim


%end

# Generated using Blivet version 3.4.3
ignoredisk --only-use=nvme0n1
autopart
# Partition clearing information
clearpart --none --initlabel

# System timezone
timezone Europe/Warsaw --utc

#Root password
rootpw --lock
user --groups=wheel --name=fedora --password=$y$j9T$Rw06fSjzRWFZ2xKDR3tjne7Z$uXqibpj5Rq7Ct2RKYIw0siIpK2mrAM/nIhxFPa0kVpC --iscrypted --gecos="fedora"



%post
# Repositories
dnf -y sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Signal Desktop as Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && flatpak install -y flathub org.signal.Signal

sudo systemctl disable NetworkManager-wait-online.service
sudo systemctl set-default graphical.target
sudo systemctl enable lightdm

mkdir -p ~/.config/polybar
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/kitty
touch ~/.config/user-dirs.dirs

printf "
XDG_DESKTOP_DIR="$HOME/Pulpit"
XDG_DOWNLOAD_DIR="$HOME/Pobrane"
XDG_TEMPLATES_DIR="$HOME/Szablony"
XDG_PUBLICSHARE_DIR="$HOME/Publiczny"
XDG_DOCUMENTS_DIR="$HOME/Dokumenty"
XDG_MUSIC_DIR="$HOME/Muzyka"
XDG_PICTURES_DIR="$HOME/Obrazy"
XDG_VIDEOS_DIR="$HOME/Wideo"
" > ~/.config/user-dirs.dirs


wget -O ~/.config/sxhkd/sxhkdrc https://raw.githubusercontent.com/ShogoXY/bspwm/main/sxhkd/sxhkdrc 
wget -O ~/.config/bspwm/bspwmrc https://raw.githubusercontent.com/ShogoXY/bspwm/main/bspwm/bspwmrc
wget -O ~/.config/polybar/config.ini https://raw.githubusercontent.com/ShogoXY/bspwm/main/polybar/config.ini
wget -O ~/.config/polybar/launch.sh https://raw.githubusercontent.com/ShogoXY/bspwm/main/polybar/launch.sh
wget -O ~/.config/kitty/kitty.conf https://raw.githubusercontent.com/ShogoXY/bspwm/main/kitty/kitty.conf
wget -O ~/.config/picom.conf https://raw.githubusercontent.com/ShogoXY/bspwm/main/picom.conf
wget -O ~/.gtkrc-2.0 https://raw.githubusercontent.com/ShogoXY/bspwm/main/gtkrc-2.0


chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/bspwm/bspwmrc


git clone https://github.com/ShogoXY/bspwm
cp -r ~/bspwm/fonts/. ~/.fonts
cp -r ~/bspwm/Thunar/. ~/.config/Thunar
cp -r ~/bspwm/wallpapers/. ~/wallpapers
git clone https://github.com/jluttine/rofi-power-menu

cp -r ~/rofi-power-menu/. ~/.config/rofi/
cp -r ~/bspwm/rofi/. ~/.config/rofi/
rm -rf ~/bspwm
rm -rf ~/rofi-power-menu
xdg-user-dirs-update


git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 
echo "vim.cmd([[set confirm]])" >> ~/.config/nvim/init.lua


#######################################################################

#systemctl enable --now dnf-automatic.timer
########################################################################
%end

# Reboot After Installation
reboot --eject
