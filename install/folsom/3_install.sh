#!/bin/sh
apt-get -y install mysql-server python-mysqldb
apt-get -y install rabbitmq-server
RABBIT_PASSWORD=ribnctu
rabbitmqctl change_password guest $RABBIT_PASSWORD
