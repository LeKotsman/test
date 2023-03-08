
#!/bin/bash
# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
 echo "You must be a root user to run this script, please run sudo ./removeSnapd.sh" 2>&1
 exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

cd "$builddir" || exit
mkdir -p "/home/$username/.config"
mkdir -p "/home/$username/.fonts"
mkdir -p "/home/$username/Pictures"
mkdir -p /usr/share/sddm/themes

apt purge snapd -y
apt-mark hold snapd
curl -L https://nixos.org/nix/install | sh
apt install nala -y
nala update
nala upgrade -y
nala install dialog apt-utils tasksel flatpak libqt5svg5 qml-module-qtquick-controls qml-module-qtquick-controls2 feh bspwm sxhkd kitty rofi polybar picom thunar network-manager nitrogen lxpolkit x11-xserver-utils unzip yad wget pulseaudio pavucontrol sddm toucheeg -y
tar -xzvf slice.tar.gz --strip 1 --one-top-level=/usr/share/sddm/themes/slice
cp -f "$builddir/sddm.conf" /etc/
systemctl enable sddm
systemctl set-default graphical.target
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install md.obsidian.Obsidian -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.visualstudio.code -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub us.zoom.Zoom -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y
flatpak install flathub org.gnome.font-viewer -y
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub org.yuzu_emu.yuzu -y
flatpak install flathub org.eclipse.Java -y
flatpak install flathub org.gnu.emacs -y