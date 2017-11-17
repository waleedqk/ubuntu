# systemd

**List services**

    systemctl list-units | grep .service

**Service Status**

    systemctl status ssh.service

**Check service status**

    systemctl is-enabled ssh

**Disable Service**

So it does not start up on next boot

    sudo systemctl disable ssh.service

**Enable Service**

So it does starts up on next boot

    sudo systemctl enable ssh.service

**Stop a service**

    sudo systemctl stop ssh.service

or

    sudo systemctl stop ssh

**Start a service**

    sudo systemctl start ssh.service

or

    sudo systemctl start ssh    

**Restart a service**

    sudo systemctl restart ssh.service

or

    sudo systemctl restart ssh    

**See logging**

    journalctl

show log messages from this boot


    journalctl -b

log from a specified service

    journalctl -u ssh    