#version=F33

# URLs and REPOs
url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-33&arch=x86_64"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f33&arch=x86_64" --cost=0
# RPMFusion Free
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-33&arch=x86_64" --includepkgs=rpmfusion-free-release
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-33&arch=x86_64" --cost=0
repo --name=rpmfusion-free-tainted --mirrorlist="https://mirrors.rpmfusion.org/metalink?repo=free-fedora-tainted-33&arch=x86_64"
# RPMFusion NonFree
repo --name=rpmfusion-nonfree --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-33&arch=x86_64" --includepkgs=rpmfusion-nonfree-release
repo --name=rpmfusion-nonfree-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-33&arch=x86_64" --cost=0
repo --name=rpmfusion-nonfree-tainted --mirrorlist="https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-tainted-33&arch=x86_64"
# Negativo17 NVIDIA/CUDA
repo --name=negativo17 --baseurl="https://negativo17.org/repos/nvidia/fedora-33/x86_64/"
# Secure Messenger
repo --name=keybase --baseurl="http://prerelease.keybase.io/rpm/x86_64"
repo --name=element --baseurl="https://download.copr.fedorainfracloud.org/results/taw/element/fedora-33-x86_64/"

# Use graphical install
graphical



### Gnome Shell Extensions
gnome-extensions-app                        # Manage GNOME Shell extensions
gnome-shell-extension-background-logo       # Background logo extension for GNOME Shell
gnome-shell-extension-system-monitor-applet # A Gnome shell system monitor extension
gnome-shell-extension-apps-menu             # Application menu for GNOME Shell
gnome-shell-extension-dash-to-dock          # Dash to Dock
gnome-shell-extension-places-menu           # Places status menu for GNOME Shell


%end

%addon com_redhat_kdump --disable --reserve-mb='128'

%end

%anaconda
# --minquality does not seem to work
#pwpolicy root --minlen=10 --minquality=50 --strict --notempty --nochanges
#pwpolicy user --minlen=8  --minquality=30 --strict --notempty --nochanges
#pwpolicy luks --minlen=10 --minquality=50 --strict --notempty --nochanges
%end

%post
# Repositories
dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm https://prerelease.keybase.io/keybase_amd64.rpm
# Element
dnf -y copr enable taw/element
# negativo17 nvidia repository
dnf config-manager --add-repo=https://negativo17.org/repos/fedora-nvidia.repo
# Packages
dnf -y install rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted --refresh
# NVIDIA
# dnf -y install nvidia-driver nvidia-settings
# Signal Desktop as Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && flatpak install -y flathub org.signal.Signal



gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
#Change Icon-Theme:
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
#Change Window-Theme:
#gsettings set org.gnome.desktop.wm.preferences theme "CoolestThemeOnEarth"
#tap to click
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
#prawy klik
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
#dodajemy przycuski minimalizacji oraz maksymalzacji
gsettings set org.gnome.desktop.wm.preferences button-layout :minimize,maximize,close


gsettings set org.gnome.desktop.background picture-uri https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg


# dnf-automatic security upgrades
# timer configuration: /etc/systemd/system/multi-user.target.wants/dnf-automatic.timer
echo -n '[commands]
upgrade_type = security
random_sleep = 0
download_updates = yes
apply_updates = yes

[emitters]
#emit_via = stdio

[email]
#email_from = dnf@localhost
#email_to = root@localhost
#email_host = localhost

[command]

[command_email]
#email_from = dnf@localhost
#email_to = root@localhost

[base]
debuglevel = 1' > /etc/dnf/automatic.conf;
systemctl enable --now dnf-automatic.timer

# For every user who wants to use Syncthing.
# systemctl enable --now syncthing@USER.service
%end

# Reboot After Installation
reboot --eject
