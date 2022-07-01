#version=F33

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
repo --name=keybase --baseurl="http://prerelease.keybase.io/rpm/x86_64"
repo --name=element --baseurl="https://download.copr.fedorainfracloud.org/results/taw/element/fedora-36-x86_64/"

# Use graphical install
graphical
############################# Keyboard layouts
keyboard --xlayouts='pl'
############################# System language
lang pl_PL.UTF-8


# System timezone
##############################
timezone Europe/Warsaw


%packages


@Fedora Workstation
################################################################
#@^workstation-product-environment
#@admin-tools
#@development-tools
#@editors
#@libreoffice
#@office
#@sound-and-video
#@system-tools

##kde-desktop
#arc-kde
#################################################################

### Gnome Shell Extensions
gnome-extensions-app                        # Manage GNOME Shell extensions
gnome-shell-extension-background-logo       # Background logo extension for GNOME Shell
gnome-shell-extension-system-monitor-applet # A Gnome shell system monitor extension
gnome-shell-extension-apps-menu             # Application menu for GNOME Shell
gnome-shell-extension-dash-to-dock          # Dash to Dock
gnome-shell-extension-places-menu           # Places status menu for GNOME Shell
gnome-shell-extension-caffeine
gnome-tweak-tool
arc-theme
papirus-icon-theme
lutris
steam
wine
vlc
ffmpeg
tlp
git




%end


%post
# Repositories
dnf -y sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Signal Desktop as Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && flatpak install -y flathub org.signal.Signal
#flatpak -y install spotify

sudo wget --output-document=/usr/share/backgrounds/fedora-workstation/coffee.jpg https://raw.githubusercontent.com/ShogoXY/bspwm/main/wallpapers/coffee.jpg

wget https://raw.githubusercontent.com/ShogoXY/bspwm/main/install.sh
bash install.sh

sudo systemctl disable NetworkManager-wait-online.service

#######################################################################

# Packages
# NVIDIA
# dnf -y install nvidia-driver nvidia-settings

# dnf-automatic security upgrades
# timer configuration: /etc/systemd/system/multi-user.target.wants/dnf-automatic.timer
#echo -n '[commands]
#upgrade_type = security
#random_sleep = 0
#download_updates = yes
#apply_updates = yes


# Reboot After Installation
reboot --eject
