#!/bin/sh
service keystone restart
keystone-manage db_sync
