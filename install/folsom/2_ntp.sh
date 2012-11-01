#!/bin/sh
cat >> /etc/ntp.conf <<EOF
server ntp.ubuntu.com
server 127.127.1.0
fudge 127.127.1.0 stratum 10
EOF
service ntp restart
