# k3s master-node setup

### 1. Install masternode

```
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --node-name k3s-master-01 --disable=traefik,local-storage
```

```
ssh liexner@master "cat /etc/rancher/k3s/k3s.yaml" > ~/.kube/config.test
export KUBECONFIG=~/.kube/config.test
```

### 2. Install custom traefik via helm

### 3. Install cert-manager & cluster issuer

### 4. Install nfs-provisioner



# worker-node setup

### Get token from master-node
```
cat /var/lib/rancher/k3s/server/node-token
```

### Install workernode
```
curl -sfL https://get.k3s.io | K3S_NODE_NAME=k3s-worker-01 K3S_URL=https://<IP>:6443 K3S_TOKEN=<TOKEN> sh -
```

### set role for node
```
kubectl label nodes <worker_node_name> kubernetes.io/role=worker
```
# Other
### Check service as a domain
```
curl -H "Host: test.min.doman.com" -I 192.168.50.112
```

### Remove pods stuck in "Terminating" state
```
kubectl get pods --all-namespaces | grep Terminating | awk '{print $2 " -n " $1}' | xargs -L1 kubectl delete pod --grace-period=0 --force
```


