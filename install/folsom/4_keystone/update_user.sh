#!/bin/bash

get_uid () {
 ./keystoneadmin user-id --name $uname |awk '{print $1}'
}



cd $(dirname $(readlink -f ${0}))
read -p "UserName:" uname
if [ -z "$uname" ] ; then
 echo "UserName is empty."
 exit 0
fi

uid=`get_uid $uname`
if [ -z "$uid" ]; then
 echo "UserName is not exist."
 exit 0
fi

cmd="keystone user-get $uid"
echo $cmd
$cmd

read -p "New Password(empty is not change):" -s password
echo ""
if [ -z "$password" ]; then
  echo "[Password is not change.]"
 else
  echo "keystone user-password-update $uid --pass="'"********"'
  keystone user-password-update $uid --pass="$password"
fi


read -p "Change name[$uname]:" input
if [ -n "$input" ]  && [ "$input" != "$uname" ] ; then
 uname=$input
 echo keystone user-update $uid --name \""$uname"\" 
 keystone user-update $uid --name "$uname" 
fi



email=`keystone user-get  $uid |awk '($2=="email"){print $4}'`
read -p "Change email[$email]:" input
if [ -n "$input" ] && [ "$input" != "$email" ] ; then
 email=$input
 echo keystone user-update $uid --email \""$email"\" 
 keystone user-update $uid --email "$email" 
fi

enabled=`keystone user-get  $uid |awk '($2=="enabled"){print $4}'`
read -p "Change enabled[$enabled]:" input
if [ -n "$input" ]  &&  [ "$input" != "$enabled" ] ; then
 enabled=$input
 echo keystone user-update $uid --enabled \""$enabled"\" 
 keystone user-update $uid --enabled "$enabled" 
fi


cmd="keystone user-get $uid"
echo $cmd
$cmd

