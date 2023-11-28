### Install Portainer

```
helm repo add portainer https://portainer.github.io/k8s/

helm repo update

helm upgrade --install --create-namespace -n portainer portainer portainer/portainer -f values.yml
```
