# systemd

**List services**

    systemctl list-units | grep .service

**Service Status**

    systemctl status ssh.service

**Disable Service**

So it does not start up on next boot

    sudo systemctl disable ssh.service

**Stop a service**

    sudo systemctl stop ssh.service

or

    sudo systemctl stop ssh

**Start a service**

    sudo systemctl start ssh.service

or

    sudo systemctl start ssh    