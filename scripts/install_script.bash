#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

UBUNTU_CODENAME=$(lsb_release -s -c)	#Xenial
UBUNTU_VERSION=$(lsb_release -rs)	#16.04

# APP LIST
APP_LIST=(
	arandr
	arc-theme
	build-essential
	cifs-utils
	cmake
	compton
	cron
	dconf-editor
	dkms
	docker-ce
	espeak
	exfat-fuse
	exfat-utils
	expect
	feh
	fontconfig-infinality
	fonts-font-awesome
	g++
	gcc
	git
	gksu
	gnome-icon-theme-full
	gparted
	gpsprune
	gzip
	handbrake-gtk 
	handbrake-cli
	htop
	i3
	i3blocks
	inkscape
	lxappearance
	mc
	minecraft-installer
	moka-icon-theme faba-icon-theme faba-mono-icons
	netcat
	nmap
	ntp
	openssh-client
	openssh-server
	openvpn
	packeth
	pavucontrol
	python-pip
	python3-pip
<<<<<<< HEAD
	python3-tk
=======
	python-nmap
	python3-nmap
>>>>>>> 6bce8ef87041f9caba9841c76243abf75f5e0d65
	rofi
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
	thunar
	tree
	tmux
	ubuntu-restricted-extras
	vim
	virtualbox
	vlc
	wireshark
	xclip
	#xrandr
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
	#git_config
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
	sudo add-apt-repository ppa:stebbins/handbrake-releases -y

	# shutter
	sudo add-apt-repository ppa:shutter/ppa

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

	# Infinality (font renderer) http://www.webupd8.org/2013/06/better-font-rendering-in-linux-with.html
	sudo add-apt-repository ppa:no1wantdthisname/ppa -y

	# Arc Dark theme
	wget -nv https://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key -O Release.key
    sudo apt-key add - < Release.key
	sudo apt-get update
    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"

	# Moka icon 
	sudo add-apt-repository ppa:moka/daily -y

	echo "Updating package lists ..."
	sudo apt-get update -qq

}

git_config() {
    git config --global user.name "Waleed Khan"
    git config --global user.email "waleedqk@gmail.com"
    #git config --global push.default matching
}

configure_16()
{
	echo "Give user privelages for wireshark"
	sudo dpkg-reconfigure wireshark-common
	echo "a wireshark group been created in /etc/gshadow. so add user to it"
	sudo gpasswd -a $USER wireshark

	# add the vundle repo to vim
	mkdir -p ~/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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



