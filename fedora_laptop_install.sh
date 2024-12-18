#!/bin/bash

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 

sudo dnf update -y
packages=$(printf "
thunderbird
onedrive
git
mpv
mscore-fonts-all
curl
cabextract
xorg-x11-font-utils
fontconfig
flameshot
neovim
")


sudo dnf -y install $packages

sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim/lazy/
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

wget https://github.com/ShogoXY/fedora/blob/main/fedora-40-displaylink-1.14.6-1.github_evdi.x86_64.rpm
sudo dnf install fedora-40-displaylink-1.14.6-1.github_evdi.x86_64.rpm -y
rm fedora-40-displaylink-1.14.6-1.github_evdi.x86_64.rpm

## sudo dnf install "/run/media/$USER/Ventoy/fedora-40-displaylink-1.14.6-1.github_evdi.x86_64.rpm" -y

sudo dnf update

#de = "echo $DESKTOP_SESSION"
#de_g = "gnome"

if [[ "$DESKTOP_SESSION" == "gnome" ]]
then
    flatpak install flathub com.mattjakeman.ExtensionManager -y
    echo "udalosie"
    sleep 5
fi

flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub com.spotify.Client -y

nvim --headless "+Lazy! sync" +qa
nvim --headless "+Lazy! update" +qa
echo ""
mkdir -p $HOME/.fonts

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/InconsolataLGC.zip
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Mononoki.zip
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaMono.zip

for f in *.zip; do unzip "$f" -d "$HOME/.fonts/${f%.zip}"; done
rm *.zip

echo ""
echo "Installation Complete"
echo "DONE!!"
echo ""





