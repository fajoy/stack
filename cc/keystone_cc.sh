#/bin/bash
cc(){
 file=`readlink -f ./$1`
 shift 1
 echo "${file}  [make script file]"
 echo "====BEGIN===="
 tee ${file} << EOF
#!/bin/sh
$@ \$@
EOF
 echo "=====END======"
 chmod +x ${file}
}

kc(){
 cc $1 keystone $1
}
mkdir keystone
cd keystone

kc catalog
kc ec2-credentials-create
kc ec2-credentials-delete
kc ec2-credentials-get
kc ec2-credentials-list
kc endpoint-create
kc endpoint-delete
kc endpoint-get
kc endpoint-list
kc role-create
kc role-delete
kc role-get
kc role-list
kc service-create
kc service-delete
kc service-get
kc service-list
kc tenant-create
kc tenant-delete
kc tenant-get
kc tenant-list
kc tenant-update
kc token-get
kc user-create
kc user-delete
kc user-get
kc user-list
kc user-password-update
kc user-role-add
kc user-role-remove
kc user-update
kc discover
kc help
