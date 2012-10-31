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
 dstdir=`echo $@ |awk '{ printf "./"; for(i=2;i<NF;i++) printf $(i)"/" }'`
 cmd=`echo $@| awk '{ printf $(NF) }'`
 cd ${dstdir}
 cc ${cmd} $@ 
 cd ${srcdir}
}

mkdir rados  -p
cd rados

   
ccc rados lspools
ccc rados mkpool
ccc rados cppool
ccc rados rmpool
ccc rados df
ccc rados ls

ccc rados chown

ccc rados get
ccc rados put
ccc rados create
ccc rados rm
ccc rados cp
ccc rados listxattr
ccc rados getxattr
ccc rados setxattr
ccc rados rmxattr
ccc rados stat
ccc rados mapext
ccc rados lssnap
ccc rados mksnap
ccc rados rmsnap
ccc rados rollback

ccc rados bench
ccc rados default
ccc rados load-gen
ccc rados listomapkeys
ccc rados getomapval
ccc rados listomapvals
ccc rados rmomapkey
ccc rados getomapheader
ccc rados setomapheader

ccc rados import
ccc rados export
