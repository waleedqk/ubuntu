# Search devices on Interface

Arp-scan can be used to do a network scan. To install it:

    sudo apt-get install arp-scan

If using Wi-Fi:

    sudo arp-scan -l --interface=wlan0

Or if using ethernet:

    sudo arp-scan -l --interface=eth0