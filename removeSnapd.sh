
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
#curl -L https://nixos.org/nix/install | sh
apt install nala -y
nala update
nala upgrade -y
nala install dialog apt-utils tasksel -y