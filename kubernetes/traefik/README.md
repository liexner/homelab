# Install Traefik via Helm
```
helm repo add traefik https://helm.traefik.io/traefik

helm upgrade --install --create-namespace --namespace traefik -f values.yaml traefik traefik/traefik

```
# Create basic auth middleware
## Create basic auth secret
```
htpasswd -c ./auth admin
kubectl create secret generic auth-secret --from-file auth -n traefik
```
## Create middleware 
```
kubectl apply -f auth-middleware.yml
```