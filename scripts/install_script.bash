#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

UBUNTU_CODENAME=$(lsb_release -s -c)	#Xenial
UBUNTU_VERSION=$(lsb_release -rs)	#16.04

# APP LIST
APP_LIST=(
	build-essential
	cifs-utils
	cmake
	cron
	dconf-editor
	dkms
	docker-ce
	espeak
	exfat-fuse
	exfat-utils
	expect
	g++
	gcc
	git
	gksu
	gparted
	gzip
	handbrake-gtk 
	handbrake-cli
	htop
	i3
	inkscape
	mc
	minecraft-installer
	nmap
	ntp
	openssh-client
	openssh-server
	openvpn
	python-pip
	python3-pip
	screen
	shutter
	spotify-client
	sqlite3
	ssh
	steam
	synaptic
	syncthing
	tcpdump
	#terminator
	telnet
	texlive-full
	texstudio
	tree
	tmux
	ubuntu-restricted-extras
	vim
	virtualbox
	vlc
	wireshark
	xclip
	youtube-dl
)

main_16()
{
	apt_update
	clear
	#add_16_ppa

	echo "Installing apps now ..."
	sudo apt-get -y install "${APP_LIST[@]}"

	echo ""	
	#install_gchrome
	#configure_16
	#install_ros

}

apt_update()
{
	echo "update..."
	apt-get update
}

add_16_ppa()
{
	echo "Adding PPAs"
	sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
	
	# terminator terminal
	#add-apt-repository ppa:gnome-terminator/ppa -y

	# open source video transcoder
	add-apt-repository ppa:stebbins/handbrake-releases -y

	# shutter
	add-apt-repository ppa:shutter/ppa

	# minecraft
	sudo add-apt-repository -y ppa:minecraft-installer-peeps/minecraft-installer

	# Syncthing
	curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
	echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

	# Docker
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

	# Spotify
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
	echo 'deb http://repository.spotify.com stable non-free' | sudo tee /etc/apt/sources.list.d/spotify.list

	echo "Updating package lists ..."
	sudo apt-get update -qq

}

configure_16()
{
	echo "Give user privelages for wireshark"
	sudo dpkg-reconfigure wireshark-common
	echo "a wireshark group been created in /etc/gshadow. so add user to it"
	sudo gpasswd -a $USER wireshark
}

install_gchrome()
{
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	sudo apt-get update 
	sudo apt-get install google-chrome-stable -y
}


install_ros()
{
	UBUNTU_CODENAME=$(lsb_release -s -c)
	case $UBUNTU_CODENAME in
		trusty)
			ROS_DISTRO=indigo;;
		xenial)
			ROS_DISTRO=kinetic;;
		*)
			echo "Unsupported version of Ubuntu detected. Only trusty (14.04.*) and xenial (16.04.*) are currently supported."
		exit 1
	esac

	sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu $UBUNTU_CODENAME main\" > /etc/apt/sources.list.d/ros-latest.list"
	wget -qO - http://packages.ros.org/ros.key | sudo apt-key add -

	echo "Updating package lists ..."
	sudo apt-get -qq update

	echo "Installing ROS $ROS_DISTRO ..."
	sudo apt-get -qq install ros-$ROS_DISTRO-desktop python-rosinstall > /dev/null

	source /opt/ros/$ROS_DISTRO/setup.bash

	# Prepare rosdep to install dependencies.
	echo "Updating rosdep ..."
	if [ ! -d /etc/ros/rosdep ]; then
		sudo rosdep init > /dev/null
	fi
	rosdep update > /dev/null
}

# Update System
apt_update

case $UBUNTU_CODENAME in
	trusty)
		main_14;;
	xenial)
		main_16;;
	*)
		echo "Unsupported version of Ubuntu detected. Only trusty (14.04.*) and xenial (16.04.*) are currently supported."
	exit 1
esac



