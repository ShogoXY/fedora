#!/bin/bash

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager addrepo --from-repofile=https://negativo17.org/repos/fedora-multimedia.repo

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
displaylink
afetch
bat
cascadia-mono-nf-fonts

")


sudo dnf -y install $packages

sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim/lazy/
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
#curl -OL https://github.com/displaylink-rpm/displaylink-rpm/releases/download/v6.1.0-2/fedora-41-displaylink-1.14.7-4.github_evdi.x86_64.rpm
#sudo dnf install fedora-41-displaylink-1.14.7-4.github_evdi.x86_64.rpm -y
#rm fedora-41-displaylink-1.14.7-4.github_evdi.x86_64.rpm

## sudo dnf install "/run/media/$USER/Ventoy/fedora-40-displaylink-1.14.6-1.github_evdi.x86_64.rpm" -y

sudo dnf update

#de = "echo $DESKTOP_SESSION"
#de_g = "gnome"

if [[ "$DESKTOP_SESSION" == "gnome" ]]
then
    sudo dnf update -y
    
    packages_gnome=$(printf "
    flameshot
    ")
    wget https://raw.githubusercontent.com/ShogoXY/fedora/main/5VUhtaY.jpeg
    gsettings get org.gnome.desktop.background picture-uri 'file://$HOME/5VUhtaY.jpeg'
    gsettings get org.gnome.desktop.background picture-uri-dark 'file://$HOME/5VUhtaY.jpeg'



    #cat dump_1 | dconf load /org/gnome/settings-daemon/plugins/media-keys/
    #cat dump_2 | dconf load /org/gnome/desktop/wm/keybindings/
    #cat dump_3 | dconf load /org/gnome/shell/keybindings/
    #cat dump_4 | dconf load /org/gnome/mutter/keybindings/
    #cat dump_5 | dconf load /org/gnome/mutter/wayland/keybindings/
   
    sudo dnf -y install $packages_gnome

    flatpak install flathub com.mattjakeman.ExtensionManager -y
    echo "udalosie"
    rm $HOME/5VUhtaY.jpg 
    sleep 5
fi

flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub com.spotify.Client -y

nvim --headless "+Lazy! sync" +qa >>/dev/null
nvim --headless "+Lazy! update" +qa >>/dev/null
echo ""
mkdir -p $HOME/.fonts

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/InconsolataLGC.zip
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Mononoki.zip
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaMono.zip

for f in *.zip; do unzip "$f" -d "$HOME/.fonts/${f%.zip}"; done
rm *.zip

echo "alias cat=\"bat\"" >> ~/.bashrc
#echo "alias ls=\"eza -l --icons\"" >> ~/.bashrc
echo "afetch" >> ~/.bashrc


echo ""
echo "Installation Complete"
echo "DONE!!"
echo ""





