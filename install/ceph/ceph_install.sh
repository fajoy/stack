#!/bin/sh
wget -q -O- https://raw.github.com/ceph/ceph/master/keys/release.asc | sudo apt-key add -
tee /etc/apt/sources.list.d/ceph.list <<EOF
deb http://ceph.com/debian/ precise main
deb-src http://ceph.com/debian/ precise main
EOF
aptitude update; aptitude install ceph ceph-fuse
