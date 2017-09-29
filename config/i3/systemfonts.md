# i3 system fonts

**Download YosemiteSanFranciscoFont**

###  Download the repo
### https://github.com/supermarin/YosemiteSanFranciscoFont
### move *.ttf files from the repo to ~/.fonts/

**Font Renderer**

    sudo add-apt-repository ppa:no1wantdthisname/ppa
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install fontconfig-infinality

**Update gtk fonts**

    sudp apt-get install lxappearance

### open lxappearance and in there under fefault font see if System San Francisco Display shows up
### if not, make a mior change like change font size, this should create some config files
### open ~/.gtkrc-2.0 and update the following

    vim ~/.gtkrc-2.0
    gtk-font-name="System San Francisco Display 12"

### also open ~/.config/gtk-3.0/settings.ini and update

    vim ~/.config/gtk-3.0/settings.ini
    gtk-font-name=System San Francisco Display 12

**i3 thunar window explorer**

    sudp apt-get install thunar gnome-icon-theme-full

**Arc GTK Theme**

 ### repo @ https://github.com/horst3180/Arc-theme
 ### look at the Ubuntu package link in the repo

    wget -nv https://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key -O Release.key
    sudo apt-key add - < Release.key
    rm ~/Release.key
    sudo apt-get update
    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
    sudo apt-get update
    sudo apt-get install arc-theme

### open lxappearance and choose the Arc Dark theme and apply

**Moka icon theme**

    sudo add-apt-repository ppa:moka/daily
    sudo apt-get update
    sudo apt-get install moka-icon-theme faba-icon-theme faba-mono-icons

**Rafi - replace dmenu_run**

    sudo apt-get install rofi

**Compton - transparent windows**

    sudo apt-get install compton