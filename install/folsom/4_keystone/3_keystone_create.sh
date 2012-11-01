#!/bin/bash
uname=admin
password=adminpass
email=admin@localhost

tname=admin
rname=admin

uid=
rid=
tid=

get_id () {
    echo `$@ | awk '/ id / { print $4 }'`
}
get_uid () {
 ./keystoneadmin user-id --name $uname |awk '{print $1}'
}
get_rid () {
 ./keystoneadmin role-id --name $rname |awk '{print $1}'
}
get_tid () {
 ./keystoneadmin tenant-id --name $tname |awk '{print $1}'
}

cd $(dirname $(readlink -f ${0}))

if [ -n "$uname" ];then
 uid=`get_uid $uname`
 if [ -z $uid ];then
  echo "create [$uname] user"
  cmd="keystone user-create --name=$uname --pass="$password" --email=$email"
  echo $cmd
  uid=$(get_id $cmd)
 fi
 echo "uname= $uname"
 echo "uid= $uid"
fi

if [ -n "$tname" ];then
 tid=`get_tid $tname`
 if [ -z $tid ];then
  echo "create [$tname] tenant"
  cmd="keystone tenant-create --name=$tname"
  echo $cmd
  tid=$(get_id $cmd)
 fi
 echo "tname= $tname"
 echo "tid= $tid"
fi

if [ -n "$rname" ];then
 rid=`get_rid $rname`
 if [ -z $rid ];then
  echo "create [$tname] role"
  cmd="keystone role-create --name=$rname"
  echo $cmd
  rid=$(get_id $cmd)
 fi
 echo "rname= $rname"
 echo "rid= $rid"
fi

if [ -n "$uid" ] && [ -n "$rid" ] && [ -n "$tid" ] ;then
 cmd="keystone user-role-add --user-id $uid --tenant-id $tid --role-id $rid  "
 echo $cmd
 $cmd
fi
