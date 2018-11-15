# Saving SSH Aliasses for Hosts

This is for Linux and SSH users who often log in to remote systems. Having to type the same info over and over again is mind-numbingly repetitive, but using an SSH config file makes the process much more convenient.

## Create the Relevat Folder and Files

To get started run the following commands:

    mkdir -p ~/.ssh
    touch ~/.ssh/config
    if [ ! -e ~/.ssh/config ] ; then touch ~/.ssh/config; else echo 0; fi

## Add Alias for Host

Host host_alias_nickname        # any name for the host
HostName 192.168.178.05         # IP, .local, or hostname if defined
User username                   # your username
Port 22                         # port to use to connect to server
IdentityFile ~/path/to/id_file  # key used to connect to server
ServerAliveInterval X           # refreshing your connection every X seconds
ServerAliveCountMax Y           # a maximum number of Y times

## Keep Alive FUnctionality

The  “keep alive” function will prevent your connection from ending by refreshing your connection every X seconds, a maximum number of Y times:

ServerAliveInterval 120
ServerAliveCountMax 30

Our example will refresh every 2 minutes for a maximum of 30 consecutive times. That means, it will stop refreshing after an hour. This works from your client regardless of what your server has configured.