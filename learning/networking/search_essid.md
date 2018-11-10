

**search for available connections on all networks intefaces**

    sudo iwlist scan
    sudo iwlist scan | grep ESSID

### alternatively search for connections on specified interface

    sudo iwlist wlp3s0 scan
    sudo iwlist wlp3s0 scan | grep ESSID

**Interface with an SSID**

    sudo iwconfig wlp3s0 essid BELL28
    iwconfig wlp3s0

### get IP address on the interface

    sudo dhclient wlp3s0
    ifconfig wlp3s0

**edit /etc/network/interfaces**

    sudo vim /etc/network/interfaces

### add the follwing lines   

 auto wlp3s0
 iface wlp3s0 inet dhcp
    wpa-ssid "BELL28"
    wpa-psk "ABCDbell"

### in Ubuntu 16.04 you can also
   
   cd /sys/class/net
   
### it has the interface folder names 
   
   cd /sys/class/net/<wireless-interface>/wireless/
   
**restart networking service**

    sudo service network-manager restart
    sudo service networking restart

**list obtained IP Address**

    id addr
