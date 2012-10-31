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

ccc(){
 srcdir=`pwd`
 dstdir=`echo $@ |awk '{printf "./"; for(i=2;i<NF;i++) printf $(i)"/" }'`
 cmd=`echo $@| awk '{ printf $(NF) }'`
 cd ${dstdir}
 cc ${cmd} $@ 
 cd ${srcdir}
}
mkdir ceph/mon -p
mkdir ceph/mds -p
mkdir ceph/auth -p
mkdir ceph/osd/pool -p
mkdir ceph/osd/crush -p
mkdir ceph/osd/blacklist -p
mkdir ceph/pg -p
cd ceph

   
   
ccc ceph health 
ccc ceph quorum_status  


ccc ceph auth get-or-create
ccc ceph auth del 
ccc ceph auth list 

ccc ceph mds stat 
ccc ceph mds tell 

ccc ceph mon add 
ccc ceph mon delete 
ccc ceph mon stat 
ccc ceph mon tell 

ccc ceph osd dump
ccc ceph osd tree 
ccc ceph osd down
ccc ceph osd in 
ccc ceph osd out
ccc ceph osd set
ccc ceph osd unset 
ccc ceph osd pause 
ccc ceph osd unpause 
ccc ceph osd tell
ccc ceph osd getcrushmap 
ccc ceph osd getmap 
ccc ceph osd crush set
ccc ceph osd crush move
ccc ceph osd crush reweight
ccc ceph osd create
ccc ceph osd rm 
ccc ceph osd lost
ccc ceph osd reweight 
ccc ceph osd blacklist add
ccc ceph osd blacklist rm
ccc ceph osd pool mksnap
ccc ceph osd pool rmsnap
ccc ceph osd pool create
ccc ceph osd pool delete
ccc ceph osd pool rename
ccc ceph osd pool set
ccc ceph osd scrub 
ccc ceph osd repair 
ccc ceph osd tell 

ccc ceph pg dump 
ccc ceph pg scrub 
ccc ceph pg map 
