# SSH Passwordless Login Using SSH

## Host vs Server

**Host**

The host is the machine that which you have physical access to. The laptop or desktop you are using to access a remote machine.

**Server**

The server is the machine that you do not have physical access to. It can be anywhere in the world, but it has internet access and you have valid credentials to log into that machine.

## 1) Create the .ssh directory on the Server

    mkdir -p ~/.ssh

## 2) Create a ssh_key on the Host

Generate a pair of public keys on the host from where you will log into the server:

    mkdir -p ~/.ssh
    cd ~/.ssh
    ssh-keygen -t rsa -b 4096

You will be prompted for a name here. If none is provided it will use the default name. Assume in our example you want to create a key named ```id_ras_pi``` to ssh into a raspberry pi.

    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ras_pi

## 3) Upload Generated Public Keys to rasp_pi

Use SSH from host and upload new generated public key on the server under servers‘s .ssh directory as a file name authorized_keys.

    cat ~/.ssh/id_ras_pi.pub | ssh pi@raspberry.local 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'

or alternatively:

    ssh-copy-id -i ~/.ssh/id_ras_pi pi@raspberry.local

## 4) Set SSH Permissions on rasp_pi

Due to different SSH versions on servers, we need to set permissions on .ssh directory and authorized_keys file on the server.

    ssh pi@raspberry.local "chmod 700 ~/.ssh; chmod 640 ~/.ssh/authorized_keys"

## 5) SSH login passwordless

SSH into the rasp_pi without having to provide the password:

    ssh pi@raspberry.local

or if key needs to be specified:

    ssh -i ~/.ssh/id_ras_pi pi@raspberry.local