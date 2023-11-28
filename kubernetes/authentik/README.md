```
helm repo add authentik https://charts.goauthentik.io

helm repo update

helm upgrade --install --create-namespace -n authentik  authentik authentik/authentik -f values.yml
```