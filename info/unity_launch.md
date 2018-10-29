## Create Desktop Application launcher

save it to ```home/<user>/.local/share/applications/appname.desktop``` for a launcher tied to your own login
or to ```/usr/share/applications/appname.desktop``` if you want it to apply to other users of your system

### Enter the following in the file
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm
Icon=~/Documents/installs/pycharm-community-2017.2.3/bin/pycharm.png
Exec="~/Documents/installs/pycharm-community-2017.2.3/bin/pycharm.sh" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm


### Start Nautalis ###
nautilus ~/.local/share/applications
