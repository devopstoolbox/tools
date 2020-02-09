#!/usr/bin/env bash

OS=fedora31

virsh shutdown "${OS}"
virsh destroy "${OS}"
sleep 2
virsh snapshot-delete --current "${OS}"
virsh undefine --remove-all-storage --delete-snapshots "${OS}"

mkdir -p ~/.kvm

virt-install \
--connect qemu:///session \
--name "${OS}" \
--ram 4096 \
--vcpus 2 \
--disk path="${HOME}/.kvm/${OS}.img,size=40" \
--os-variant fedora29 \
--os-type linux \
--network bridge=virbr0 \
--graphics none \
--console pty,target_type=serial \
--location 'http://fedora.inode.at/releases/31/Server/x86_64/os/' \
--extra-args="console=tty0 console=ttyS0,115200n8 serial"

virsh snapshot-create-as "${OS}" --name baseline

virsh domiflist "${OS}"
arp -n
