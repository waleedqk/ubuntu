#!/bin/bash

set -e

add_ppa()
{
	echo "Adding PPAs"
	add-apt-repository ppa:gnome-terminator -y
	add-apt-repository ppa:eugenesan/ppa -y
	apt-add-repository ppa:blahota/texstudio -y
	add-apt-repository ppa:pipelight/stable -y
}

apt_update()
{
	echo "updating repositories"
	apt-get update
}

install_packages()
{
	echo "Installing packages"
	apt-get install build-essential ubuntu-restricted-extras synaptic exfat-fuse exfat-utils gcc g++ openssh-server openssh-client git xclip terminator texlive-full mc texstudio vlc vim wireshark libnss3* --install-recommends pipelight-multi -y 
}

#add_ppa
apt_update
install_packages

sudo pipelight-plugin --update
sudo pipelight-plugin --enable silverlight
# sudo pipelight-plugin --disable silverlight --enable silverlight5.0
sudo pipelight-plugin --create-mozilla-plugins 

echo "Finished adding PPAs and insatlling applications"
exit 0

