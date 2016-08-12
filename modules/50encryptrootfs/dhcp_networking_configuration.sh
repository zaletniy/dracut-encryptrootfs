#!/bin/sh
#
# DHCP networking configuration
#
# should perform configuration or exit with > 0 return code
# will be called several time until success or give up during
# Main Loop (https://www.kernel.org/pub/linux/utils/boot/dracut/dracut.html#_main_loop)

ip=$(ip addr | grep "inet " | grep -v "127.")
if [ -z "$ip" ]
then
    dhclient -v -timeout 10
    exit 1
else
    exit 0
fi