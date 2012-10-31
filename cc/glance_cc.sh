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

gc(){
 cc $1 glance $1
}
mkdir glance
cd glance

gc help
gc add
gc update
gc delete
gc index
gc details
gc show
gc clear
gc image-members
gc member-images
gc member-add
gc member-delete
gc members-replace
