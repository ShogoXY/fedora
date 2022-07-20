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


@"base-x"
@"Common NetworkManager Submodules"
@"Fonts"
@"Hardware Support"
bluedevil
breeze-gtk
breeze-icon-theme
cagibi
colord-kde
cups-pk-helper
dolphin
glibc-all-langpacks
gnome-keyring-pam
kcm_systemd
kde-gtk-config
kde-partitionmanager
kde-print-manager
kde-settings-pulseaudio
kde-style-breeze
kdegraphics-thumbnailers
kdeplasma-addons
kdialog
kdnssd
kf5-akonadi-server
kf5-akonadi-server-mysql
kf5-baloo-file
kf5-kipi-plugins
khotkeys
kmenuedit
konsole5
kscreen
kscreenlocker
ksshaskpass
ksysguard
kwalletmanager5
kwebkitpart
kwin
NetworkManager-config-connectivity-fedora
pam-kwallet
phonon-qt5-backend-gstreamer
pinentry-qt
plasma-breeze
plasma-desktop
plasma-desktop-doc
plasma-drkonqi
plasma-nm
plasma-nm-l2tp
plasma-nm-openconnect
plasma-nm-openswan
plasma-nm-openvpn
plasma-nm-pptp
plasma-nm-vpnc
plasma-pa
plasma-user-manager
plasma-workspace
plasma-workspace-geolocation
polkit-kde
qt5-qtbase-gui
qt5-qtdeclarative
sddm
sddm-breeze
sddm-kcm
setroubleshoot
sni-qt
xorg-x11-drv-libinput
git
vim
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

%end

# Reboot After Installation
reboot --eject
