# i3 system fonts

**Download YosemiteSanFranciscoFont**

###  Download the repo
### https://github.com/supermarin/YosemiteSanFranciscoFont
### move *.ttf files from the repo to ~/.fonts/


**Update gtk fonts**

### Install lxappearance
### open lxappearance and in there under fefault font see if System San Francisco Display shows up
### if not, make a mior change like change font size, this should create some config files
### open ~/.gtkrc-2.0 and update the following

    gtk-font-name="System San Francisco Display 12"

### also open ~/.config/gtk-3.0/settings.ini and update

    gtk-font-name=System San Francisco Display 12