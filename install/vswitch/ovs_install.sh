#!/bin/sh
#http://blog.allanglesit.com/2012/03/linux-kvm-ubuntu-12-04-with-openvswitch/
apt-get install openvswitch-controller openvswitch-brcompat openvswitch-switch openvswitch-datapath-source
#apt-get install iperf pv
cat >>/etc/default/openvswitch-switch <<EOF
BRCOMPAT=yes
EOF
#aptitude purge ebtables
module-assistant auto-install openvswitch-datapath
service openvswitch-switch start
service openvswitch-controller restart
