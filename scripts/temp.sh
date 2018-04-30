#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

UBUNTU_CODENAME=$(lsb_release -s -c)	#bionic
UBUNTU_VERSION=$(lsb_release -rs)	#18.04


APP LISTAPP_LIST=(
arandr
arp-scan
build-essential    
cifs-utils
cmake
cron
dconf-editor    
dkms
espeak
exfat-fuse    exfat-utils
expect
g++    gcc
gimp
git
gparted
gzip
handbrake-gtk    handbrake-cli    
htop
imagemagick    
inkscape    
keepass2    
# kicad
# minecraft-installer
netcat
nmap
npm
ntp
openssh-client    openssh-server
openvpn
packeth
pavucontrol
python3-pip
screen
shutter
simplescreenrecorder simplescreenrecorder-lib    
# spotify-client
sqlite3
ssh
sshfs
# steam
synaptic
syncthing
tcpdump
# terminator
telnet
texlive-full    texstudio    
tree
tmux
ubuntu-restricted-extras    
vim
# virtualbox
# vlc
wireshark
xclip
# youtube-dl
)

install_app()
{
echo "Installing apps now ..."
sudo apt-get -y install "${APP_LIST[@]}"
}
