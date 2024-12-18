#!/bin/bash

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 

sudo dnf update -y

sudo dnf install thunderbird onedrive git mpv mscore-fonts-all curl cabextract xorg-x11-font-utils fontconfig flameshot neovim -y

sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim/lazy/
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

sudo dnf install "/run/media/$USER/Ventoy/fedora-40-displaylink-1.14.6-1.github_evdi.x86_64.rpm" -y

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
cp -r /run/media/$USER/Ventoy/fonts $HOME/.fonts

echo ""
echo "Installation Complete"
echo "DONE!!"
echo ""





