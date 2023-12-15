## Runit init scripts

This repository contains runit init scripts.

This repository is based on https://github.com/neeshy/runit-rc and https://github.com/void-linux/void-runit

## Dependencies

- A POSIX shell
- grep
- sed
- findutils
- procps-ng (needs pkill -s0,1)
- kmod
- util-linux (needs wall)
- iproute2
- runit

### How to use it

To see enabled services for "current" runlevel:

    $ ls -l /var/service/

To see available runlevels (default and single, which just runs sulogin):

    $ ls -l /etc/runit/runsvdir

To enable and start a service into the "current" runlevel:

    # ln -s /etc/sv/<service> /var/service

To disable and remove a service:

    # rm -f /var/service/<service>

To view status of all services for "current" runlevel:

    # sv status /var/service/*
