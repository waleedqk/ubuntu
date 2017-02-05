#!/bin/bash

echo "Adding PPAs"
add-apt-repository ppa:gnome-terminator -y
add-apt-repository ppa:eugenesan/ppa -y
apt-add-repository ppa:blahota/texstudio -y

echo "updating repositories"
apt-get update

echo "Installing packages"
apt-get install build-essential ubuntu-restricted-extras synaptic exfat-fuse exfat-utils gcc g++ openssh-server openssh-client git xclip terminator texlive-full mc texstudio vlc -y 

echo "Finished adding PPAs and insatlling applications"
exit 0

