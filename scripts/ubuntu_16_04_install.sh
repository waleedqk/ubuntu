#!/bin/bash

set -e

add_ppa()
{
	echo "Adding PPAs"
	add-apt-repository ppa:gnome-terminator -y
	add-apt-repository ppa:eugenesan/ppa -y
	apt-add-repository ppa:blahota/texstudio -y
	add-apt-repository ppa:stebbins/handbrake-releases -y
}

apt_update()
{
	echo "updating repositories"
	apt-get update
}

install_packages()
{
	echo "Installing packages"
	apt-get install build-dep build-essential ubuntu-restricted-extras synaptic exfat-fuse exfat-utils gcc g++ openssh-server openssh-client git gksu xclip terminator texlive-full mc texstudio vlc vim wireshark libnss3* handbrake-gtk handbrake-cli -y 
}

#add_ppa
apt_update
install_packages

echo "Finished adding PPAs and insatlling applications"
exit 0

