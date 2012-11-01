#!/bin/sh
cat <<EOF >>/etc/apt/sources.list
deb  http://ubuntu-cloud.archive.canonical.com/ubuntu precise-proposed/folsom main
deb http://ubuntu-cloud.archive.canonical.com/ubuntu precise-updates/folsom main
EOF
apt-get install ubuntu-cloud-keyring
#apt-get update && apt-get -y dist-upgrade
