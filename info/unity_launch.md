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

### Start Nautalis ###
nautilus ~/.local/share/applications
