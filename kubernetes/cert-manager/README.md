# Install cert-manager via apply
```
<!-- https://cert-manager.io/docs/installation/ -->


helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true

```
# Install cluster-issuer
```
kubectl apply -f clusterissuer.yml 
```
