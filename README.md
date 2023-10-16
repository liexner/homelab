# k3s cluster

### Install masternode

```
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --node-name k3s-master-01
```

### Install cert-manager & cluster issuer
```
install -> https://cert-manager.io/docs/installation/
apply -> https://github.com/liexner/kubernetes/blob/main/cluster-issuer/clusterIssuer.yml
```

### Get token
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

### Check service as a domain
```
curl -H "Host: test.min.doman.com" -I 192.168.50.112
```
