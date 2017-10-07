
**list network devices**

    ip link
    ifconfig

**restart the interface**

    sudo ifconfig wlp3s0 up

**wireless interface capabilities**

    iwconfig wlp3s0

**search for available connections on all networks intefaces**

    sudo iwlist scan
    sudo iwlist scan | grep ESSID

### alternatively search for connections on specified interface

    sudo iwlist wlp3s0 scan
    sudo iwlist wlp3s0 scan | grep ESSID

**edit /etc/network/interfaces**

    sudo vim /etc/network/interface

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
