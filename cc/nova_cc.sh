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

nc(){
 cc $1 nova $1
}
mkdir nova
cd nova

nc absolute-limits
nc actions
nc add-fixed-ip
nc add-floating-ip
nc aggregate-add-host
nc aggregate-create
nc aggregate-delete
nc aggregate-details
nc aggregate-list
nc aggregate-remove-host
nc aggregate-set-metadata
nc aggregate-update
nc availability
nc boot
nc cloudpipe-create
nc cloudpipe-list
nc console-log
nc credentials
nc delete
nc describe-resource
nc diagnostics
nc dns-create
nc dccelerated accelerated accelerated ns-create-private-domain
nc dns-create-public-domain
nc dns-delete
nc dns-delete-domain
nc dns-domains
nc dns-list
nc and
nc endpoints
nc authenticate
nc flavor-create
nc flavor-delete
nc flavor-list
nc floating-ip-create
nc floating-ip-delete
nc floating-ip-list
nc floating-ip-pool-list
nc get-vnc-console
nc nc host-action
nc nc host-update
nc image-create
nc image-delete
nc image-list
nc image-meta
nc image-show
nc keypair-add
nc keypair-delete
nc keypair-list
nc list
nc live-migration
nc lock
nc meta
nc migrate
nc pause
nc rate-limits
nc reboot
nc rebuild
nc remove-fixed-ip
nc remove-floating-ip
nc rename
nc rescue
nc resize
nc resize-confirm
nc resize-revert
nc resume
nc root-password
nc secgroup-add-group-rule
nc secgroup-add-rule
nc secgroup-create
nc secgroup-delete
nc secgroup-delete-group-rule
nc secgroup-delete-rule
nc secgroup-list
nc secgroup-list-rules
nc show
nc ssh
nc suspend
nc unlock
nc unpause
nc unrescue
nc usage-list
nc volume-attach
nc volume-create
nc volume-delete
nc volume-detach
nc volume-list
nc volume-show
nc volume-snapshot-create
nc volume-snapshot-delete
nc volume-snapshot-list
nc volume-snapshot-show
nc volume-type-create
nc volume-type-delete
nc volume-type-list
nc x509-create-cert
nc x509-get-root-cert
nc bash-completion
nc help
