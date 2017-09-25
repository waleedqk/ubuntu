#!/bin/bash

set -e

apt_update()
{
	echo "updating repositories"
	apt-get update
}

add_16_ppa()
{
	echo "Adding PPAs"
	# terminator terminal
	#add-apt-repository ppa:gnome-terminator/ppa -y
	# open source video transcoder
	#add-apt-repository ppa:stebbins/handbrake-releases -y
	# shutter
	#add-apt-repository ppa:shutter/ppa


	# Not Used	
	#add-apt-repository ppa:eugenesan/ppa -y
}

install_16_packages()
{
	# need to update to include added PPA
	apt_update
	echo "Installing packages"
	apt-get install build-essential ubuntu-restricted-extras synaptic exfat-fuse exfat-utils cron cmake gcc g++ openssh-server openssh-client git i3 gparted ntp screen gksu dkms gzip cifs-utils xclip terminator tmux shutter sqlite3 texlive-full mc texstudio vlc vim wireshark tcpdump telnet handbrake-gtk handbrake-cli espeak youtube-dl dconf-editor -y 
}

install_gchrome()
{
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	sudo apt-get update 
	sudo apt-get install google-chrome-stable -y
}


echo "Apt Update"
apt_update

if [[ `lsb_release -rs` == "16.04" ]] # for Ubuntu 16.04
then

	echo "Ubuntu 16.04 detected"
	#Run this function
	#add_16_ppa
	install_16_packages
	#install_gchrome

elif [[ `lsb_release -rs` == "14.04" ]] # for Ubuntu 14.04
then

	#Run this function
	echo $HOME

else
	echo "OS not currently supported"
fi
