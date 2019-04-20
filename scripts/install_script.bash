#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

UBUNTU_CODENAME=$(lsb_release -s -c)	#Xenial bionic
UBUNTU_VERSION=$(lsb_release -rs)	#16.04 18.04

MYHOME="/home/${SUDO_USER}"

BASIC_APPS=(
    curl
    git
    make  
    xclip
)

# APP LIST
APP_LIST=(
    arp-scan # local network scan
    build-essential
    cifs-utils
    clang clang-format
    cmake
    cmus # A Console Based Audio Player for Linux
    cron    
    default-jdk
    # dkms
    espeak
    exfat-fuse exfat-utils
    expect
    filezilla
    g++ gcc
    gimp
    gparted
    # gpsprune
    gzip
    handbrake-gtk handbrake-cli
    htop
    imagemagick
    inkscape
    keepass2
    net-tools
    netcat
    nmap
    npm
    ntp
    openssh-client openssh-server
    openvpn
    packeth
    pavucontrol
    pdfshuffler
    pinta
    python-pip
    python3-pip
    screen
    # shutter
    simplescreenrecorder simplescreenrecorder-lib
    sqlite3
    ssh
    sshfs
    steam
    synaptic
    syncthing
    tcpdump
    telnet
    texlive-full texstudio
    tree
    tmux
    ubuntu-restricted-extras
    vim
    virtualbox
    wireshark
    youtube-dl
    zim
)

# SNAP APP LIST
SNAP_APP_LIST=(
    # "blender --classic"
    foobar2000
    libreoffice
    mattermost-desktop
    notepad-plus-plus
    "pycharm-community --classic"
    "skype --classic"
    spotify
    vlc
    "code --classic"
)

OPTS=`getopt -o cnth --long config,new-install,test,help -n 'parse-options' -- "$@"`

usage() { echo "Error - Usage: sudo bash $0 [-c || --config] [-n || --new-install] [-t || --test] [-h || --help]" 1>&2; exit 1; }


if [ $? != 0 ] ; then echo "Failed parsing options." usage >&2 ; exit 1 ; fi

echo "$OPTS"
eval set -- "$OPTS"

while true; do
  case "$1" in
    -c | --config )         CONFIG=true;        shift ;;
    -n | --new-install )    NEW_INSTALL=true;   shift ;;
    -t | --test )           TEST=true;          shift ;;
    -h | --help )           HELP=true;          shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

# echo "CONFIG = ${CONFIG}"
# echo "NEW_INSTALL = ${NEW_INSTALL}"
# echo "TEST = ${TEST}"
# echo "HELP = ${HELP}"

# Update the system
apt_update()
{
    echo "Update list of available packages"
    apt update
}

bionic_install()
{
    if [ ! -z "${NEW_INSTALL}" ]; then
        echo "Initializing a fresh install" 
	    basic_utility
	    directory_make
        add_ppa
        install_app   
        snap_install_app    
        git_config
        vim_config
        tmux_config
        wireshark_config
    fi

    if [ ! -z "${CONFIG}" ]; then  
	git_config
        vim_config
        tmux_config
        wireshark_config
    fi

    if [ ! -z "${TEST}" ]; then
        echo "Initializing test" 
        # install_AptanaStudio3
	    # install_Apache
	    install_avr
        install_octave
        # install_gchrome
        # install_minecraft
        # install_kicad
        install_docker
    fi
}

basic_utility()
{
    echo "Installing basic utilities now ..."
    sudo apt -y install "${BASIC_APPS[@]}"
}

directory_make()
{
    # Remove unused folders
    echo "Removing unwanted directories"
    rm -rf $MYHOME/Templates
    rm -rf $MYHOME/Examples

    echo "Creating needed directories"
    sudo -u ${SUDO_USER} mkdir -p $MYHOME/mnt
    sudo -u ${SUDO_USER} mkdir -p $MYHOME/Documents/installs
}

add_ppa()
{
    echo "Adding PPAs"

    sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"

    # open source video transcoder
    sudo add-apt-repository ppa:stebbins/handbrake-releases -y

    # shutter
    # sudo add-apt-repository ppa:shutter/ppa

    # zim
    sudo add-apt-repository ppa:jaap.karssenberg/zim

    # Syncthing
    curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
    echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list


    # SimpleScreenRecorder : https://launchpad.net/~maarten-baert/+archive/ubuntu/simplescreenrecorder
    sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y

    echo "Updating package lists ..."
    sudo apt update -qq

}

install_app()
{
    echo "Installing apps now ..."
    sudo apt -y install "${APP_LIST[@]}"
}

snap_install_app()
{
	echo "Installing snap apps now ..."

	for i in "${SNAP_APP_LIST[@]}"
	do
		echo "Installing: $i"
		sudo snap install $i
	done

    # Upgrade a Snappy package: sudo snap refresh PACKAGE NAME
    # List all of your installed Snappy packages: snap list
    # Remove a Snappy package: sudo snap remove PACKAGE NAME
}

git_config() {
    echo "Setting up git configuration ..."
    sudo -u ${SUDO_USER} git config --global user.name "Waleed Khan"
    sudo -u ${SUDO_USER} git config --global user.email "wqkhan@uwaterloo.ca"
    #git config --global push.default matching
}

vim_config()
{
    BUNDLE="$MYHOME/.vim/bundle"
    if [ ! -d "$BUNDLE/Vundle.vim" ]; then
        sudo -u ${SUDO_USER} mkdir -p "$BUNDLE"
        sudo -u ${SUDO_USER} git clone https://github.com/VundleVim/Vundle.vim.git "$BUNDLE/Vundle.vim"
    fi

    # Update existing (or new) installation
    cd "$BUNDLE/Vundle.vim"
    sudo -u ${SUDO_USER} git pull -q
    # In order to update Vundle.vim and all your plugins directly from the command line you can use a command like this:
    sudo -u ${SUDO_USER} vim -c VundleInstall -c quitall

    echo "Vim setup updated."

    if [ -f $MYHOME"/.vimrc" ] ; then
        rm $MYHOME"/.vimrc"
    fi
    sudo -u ${SUDO_USER} cp $REPO_DIR"/config/vim/vimrc" $MYHOME"/.vimrc"
}

tmux_config()
{

    if [ -f $MYHOME"/.tmux.conf" ] ; then
        rm $MYHOME"/.tmux.conf"
    fi
    sudo -u ${SUDO_USER} cp $REPO_DIR"/config/tmux/tmux.conf" $MYHOME"/.tmux.conf"
}

wireshark_config()
{
    echo "Give user privelages for wireshark"
    sudo dpkg-reconfigure wireshark-common
    # echo "a wireshark group been created in /etc/gshadow. so add user to it"
    # sudo gpasswd -a $SUDO_USER wireshark
}

install_gchrome()
{
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
    sudo apt-get update
    sudo apt-get install google-chrome-stable -y
}

install_minecraft()
{
    # minecraft
    sudo add-apt-repository -y ppa:minecraft-installer-peeps/minecraft-installer
    # update package listing
    sudo apt update
    sudo apt -y install minecraft-installer
}

install_kicad()
{
    # kicad pcb design http://kicad-pcb.org/download/ubuntu/
    sudo add-apt-repository --yes ppa:js-reynaud/kicad-4
    # update package listing
    sudo apt update
    sudo apt -y install kicad
}

install_Apache()
{
    sudo apt update
    sudo apt install apache2

    sudo ufw app list
    sudo ufw allow 'Apache'
    sudo ufw status

    sudo apt-get install mysql-server mysql-client php7.0 libapache2-mod-php7.0 php7.0-mysql php7.0-mcrypt php7.0-cli php7.0-curl phpmyadmin php-mbstring php-gettext

    #  enable the PHP mcrypt and mbstring extensions
    sudo phpenmod mcrypt
    sudo phpenmod mbstring

    sudo systemctl restart apache2
    # https://domain_name_or_IP/phpmyadmin

}

install_AptanaStudio3()
{
    # add java repo file 
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt update
    sudo apt install oracle-java7-installer

    # install dependency files for aptana studio.
    sudo apt install libjpeg62 libwebkitgtk-1.0-0 git-core

    # get aptana studio
    sudo -u ${SUDO_USER} mkdir -p $MYHOME/Documents/installs/AptanaStudio3
    cd $MYHOME/Documents/installs/ && sudo -u ${SUDO_USER} wget https://github.com/aptana/studio3/releases/download/3.7.2.201807301111/aptana.studio-linux.gtk.x86_64.zip
    sudo -u ${SUDO_USER} unzip $MYHOME/Documents/installs/aptana.studio-linux.gtk.x86_64.zip -d $MYHOME/Documents/installs/AptanaStudio3

    # Set owner permission as root
    chown -R root:root $MYHOME/Documents/installs/AptanaStudio3/
    # set execute permission to Aptana_Studio_3 directory
    sudo chmod -R 777 $MYHOME/Documents/installs/AptanaStudio3

    sudo ln -sf $MYHOME/Documents/installs/AptanaStudio3/AptanaStudio3 /usr/local/bin/AptanaStudio3

}

install_avr()
{
    sudo apt update
    sudo apt -y install gcc-avr avr-libc
    sudo apt -y install avrdude
}

install_octave()
{
    sudo apt update
    sudo apt -y install octave liboctave-dev
    # pkg install -forge control signal
}

install_docker()
{
    # Uninstall old versions
    sudo apt-get remove docker docker-engine docker.io

    # Install using the repository
    sudo apt update

    # Install packages to allow apt to use a repository over HTTPS:
    sudo apt -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

    # Add Docker’s official GPG key:
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # verify fingerprint
    sudo apt-key fingerprint 0EBFCD88

    # set up the stable repository
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

    # INSTALL DOCKER CE
    sudo apt update
    sudo apt -y install docker-ce
    # sudo apt-get install docker-ce=<VERSION>

    # add current user to docker group
    sudo usermod -aG docker $SUDO_USER

    # test docker ce is installed correctly 
    sudo docker run hello-world

    ## SYSTEMD
    # sudo systemctl enable docker
    # sudo systemctl disable docker

}


main()
{
    echo "System is running: ${UBUNTU_CODENAME} ${UBUNTU_VERSION}"

    # -z string True if the string is null (an empty string)
    if [ ! -z "${HELP}" ]; then
        echo "Requesting help: "
        usage
    fi

    apt_update
    clear

    case $UBUNTU_CODENAME in
        bionic)
            bionic_install ;;
        *)
            echo "Unsupported version of Ubuntu detected. Only bionic (18.04.*) are currently supported."
            # bionic_install
            exit 1 ;;
    esac
}

main
