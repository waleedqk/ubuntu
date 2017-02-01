#!/bin/bash

echo "Adding PPAs"
add-apt-repository ppa:gnome-terminator -y
add-apt-repository ppa:eugenesan/ppa -y
apt-add-repository ppa:blahota/texstudio -y

echo "updating repositories"
apt-get update

echo "Installing packages"
apt-get install build-essential ubuntu-restricted-extras synaptic gcc g++ openssh-server openssh-client git terminator texlive-full mc texstudio vlc -y 

echo "Finished adding PPAs and insatlling applications"
exit 0

wget http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.1/en_us/FoxitReader2.1.0805_Server_x64_enu_Setup.run.tar.gz
tar xzvf FoxitReader*.tar.gz
sudo chmod a+x FoxitReader*.run
./FoxitReader.*.run
sudo ./FoxitReader.*.run
export PATH=$PATH:/home/wqkhan/Documents/installs/pycharm-community-2016.3.2/bin/