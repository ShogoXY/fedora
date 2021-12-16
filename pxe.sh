#konfiguracja dhcpd.conf
#tftpd
#oraz isc-dhsp-server
echo "Domyślne ustawienie adresu IP na 192.168.0.2"
echo "domyślne ustawienie karty sieciowej nr 1"
echo "Instalacja potrzebnych składników"


sudo apt install syslinux-common syslinux-efi isc-dhcp-server tftpd-hpa pxelinux git -y




sudo cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bak
sudo cp /etc/default/tftpd-hpa /etc/default/tftpd-hpa.bak

sudo wget --output-document=/etc/dhcp/dhcpd.conf https://raw.githubusercontent.com/ShogoXY/fedora/main/dhcpd
sudo wget --output-document=/etc/default/tftpd-hpa https://raw.githubusercontent.com/ShogoXY/fedora/main/tftp


sudo mkdir /srv/tftp/pxelinux.cfg
sudo mkdir /srv/tftp/efi64
sudo mkdir /srv/tftp/efi64/pxelinux.cfg

sudo cp -v /usr/lib/PXELINUX/pxelinux.0 /srv/tftpboot
sudo cp -v /usr/lib/syslinux/modules/bios/ldlinux.c32 /srv/tftp
sudo cp -v /usr/lib/syslinux/modules/bios/libutil.c32 /srv/tftp
sudo cp -v /usr/lib/syslinux/modules/bios/menu.c32 /srv/tftp


sudo cp -v /usr/lib/SYSLINUX.EFI/syslinux.efi /srv/tftpboot
sudo cp -v /usr/lib/syslinux/modules/efi64/ldlinux.e64 /srv/tftp
sudo cp -v /usr/lib/syslinux/modules/efi64/libutil.c32 /srv/tftp
sudo cp -v /usr/lib/syslinux/modules/efi64/menu.c32 /srv/tftp
sudo cp -v /usr/lib/syslinux/modules/efi64/libcom32.c32 /srv/tftp


wget P /home/$USER/ https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.1.0-amd64-netinst.iso
sudo mkdir /srv/tftp/debian11
sudo mount debian-11.1.0-amd64-netinst.iso /mnt
sudo cp -rv /mnt/* /srv/tftp/debian11/
rm /home/$USER/debian-11.1.0-amd64-netinst.iso

sudo wget --output-document=/srv/tftp/pxelinux.cfg/default https://raw.githubusercontent.com/ShogoXY/fedora/main/default_bios
sudo wget --output-document=/srv/tftp/efi64/pxelinux.cfg/default https://raw.githubusercontent.com/ShogoXY/fedora/main/default_efi64


sudo systemctl restart isc-dhcp-server.service 
sudo systemctl restart tftpd-hpa.service 


