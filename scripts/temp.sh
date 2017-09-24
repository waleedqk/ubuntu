#!/bin/bash

wget http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.1/en_us/FoxitReader2.1.0805_Server_x64_enu_Setup.run.tar.gz
tar xzvf FoxitReader*.tar.gz
sudo chmod a+x FoxitReader*.run
./FoxitReader.*.run
sudo ./FoxitReader.*.run
export PATH=$PATH:/home/wqkhan/Documents/installs/pycharm-community-2016.3.2/bin/

sudo apt-get install r-base

cd ~/Downloads && wget -c http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
sudo apt-get install libgtk2.0-0:i386 libnss3-1d:i386 libnspr4-0d:i386 lib32nss-mdns libxml2:i386 libxslt1.1:i386 libstdc++6:i386
sudo apt-get -f install
sudo dpkg -i AdbeRdr9.5.5-1_i386linux_enu.deb
mimeopen -d *.pdf

sudo apt-get install youtube-dl
sudo apt-get install python3-pip
sudo pip3 install youtube-dl
sudo pip3 install --upgrade youtube-dl
