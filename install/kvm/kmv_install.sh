#!/bin/sh
#http://blog.allanglesit.com/2012/03/linux-kvm-ubuntu-12-04-with-openvswitch/
apt-get install kvm libvirt-bin 
#virsh net-destroy default
#virsh net-autostart --disable default
service libvirt-bin restart
service qemu-kvm restart
