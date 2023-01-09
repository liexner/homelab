# k3s cluster

### Install masternode

```
curl -sfL https://get.k3s.io | sh -s - --disable traefik --write-kubeconfig-mode 644 --node-name k3s-master-01
```

### Get token
```
cat /var/lib/rancher/k3s/server/node-token
```

### Install workernode
```
curl -sfL https://get.k3s.io | K3S_NODE_NAME=k3s-worker-01 K3S_URL=https://<IP>:6443 K3S_TOKEN=<TOKEN> sh -
```

### Deploy nginx
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.1/deploy/static/provider/cloud/deploy.yaml
```

### set role for node
```
kubectl label nodes <worker_node_name> kubernetes.io/role=worker
```
