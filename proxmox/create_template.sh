#!/bin/bash

#curl -s https://raw.githubusercontent.com/liexner/homelab/main/proxmox/create_template.sh | bash -s https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img 9000 ubuntu-test

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <image_link> <vm_id> <template_name>"
    exit 1
fi

image_link="$1"
vm_id="$2"
template_name="$3"

wget "$image_link" -O "cloud-image-$vm_id.img"
apt update
apt install -y libguestfs-tools
virt-customize --install qemu-guest-agent -a jammy-server-cloudimg-amd64.img
virt-customize --install nfs-common -a jammy-server-cloudimg-amd64.img

qm create 9000 --name ubuntu22-template --memory 4096 --net0 virtio,bridge=vmbr0
import_output=$(qm importdisk 9000 jammy-server-cloudimg-amd64.img local)
echo "$import_output"


rm "cloud-image-$vm_id.img"
