### Create a .desktop  file for the application ###
touch ~/.local/share/applications/opt_eclipse.desktop
chmod +x ~/.local/share/applications/opt_eclipse.desktop
nano ~/.local/share/applications/opt_eclipse.desktop

### Enter the following in the file
[Desktop Entry]
Type=Application
Version=4.6.2
Name=Eclipse
Comment=Eclipse Integrated Development Environment
Icon=** something like /opt/eclipse/icon.xpm **
Exec= ** something like /opt/eclipse/eclipse **
Terminal=false
Categories=Development;IDE;Java;


### Create a .desktop  file for the application ###
cd ~/usr/share/applications/
sudo vim pycharm.desktop

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
