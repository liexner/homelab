### Install nfs provisioner
```
upgrade --install --create-namespace -n nfs-provisioning \
  --create-namespace \
  nfs-subdir-external-provisioner \
  nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
  --set nfs.server=192.168.50.41 \
  --set nfs.path=/home/liexner/kluster-storage \
  --set storageClass.defaultClass=true
```
