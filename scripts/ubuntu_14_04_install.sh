#!/bin/bash

set -e

apt_update()
{
	echo "updating repositories"
	apt-get update
}

additional_ppa()
{
	echo "Adding additional PPAs"
	add-apt-repository ppa:gnome-terminator -y	
	apt-add-repository ppa:blahota/texstudio -y
}

essential_ppa()
{
	echo "Adding essential PPAs"
	add-apt-repository ppa:eugenesan/ppa -y
}

additional_packages()
{
	echo "Installing additional packages"
	apt-get install terminator texlive-full texstudio vlc
}

essential_packages()
{
	echo "Installing essential packages"
	apt-get install build-dep build-essential ubuntu-restricted-extras synaptic alacarte classicmenu-indicator gparted exfat-fuse exfat-utils gcc g++ openssh-server openssh-client git xclip mc vim wireshark tmux -y 
}

#add_ppa
apt_update
install_packages

echo "Finished adding PPAs and insatlling applications"
exit 0

