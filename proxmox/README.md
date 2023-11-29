```
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
apt update
apt install -y libguestfs-tools
virt-customize --install qemu-guest-agent -a jammy-server-cloudimg-amd64.img
virt-customize --install nfs-common -a jammy-server-cloudimg-amd64.img

qm create 9000 --name ubuntu22-template --memory 4096 --net0 virtio,bridge=vmbr0
qm importdisk 9000 jammy-server-cloudimg-amd64.img local
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local:9000/vm-9000-disk-0.raw

qm set 9000 --ide2 local:cloudinit && \
qm set 9000 --boot c --bootdisk scsi0 && \
qm set 9000 --serial0 socket --vga serial0 && \
qm set 9000 --ipconfig0 ip=dhcp && \
qm resize 9000 scsi0 100G && \
qm template 9000 

```
