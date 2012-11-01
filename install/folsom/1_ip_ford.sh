#!/bin/sh
sed -i -r 's/^\s*#(net\.ipv4\.ip_forward=1.*)/\1/' /etc/sysctl.conf
echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -p
