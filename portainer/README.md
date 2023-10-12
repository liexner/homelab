### Install Portainer

```
helm upgrade --install --create-namespace -n portainer portainer portainer/portainer \
    --set service.type=ClusterIP \
    --set tls.force=true \
    --set ingress.enabled=true \
    --set ingress.ingressClassName=traefik \
    --set ingress.annotations."cert-manager\.io/cluster-issuer"=letsencrypt-prod
    --set ingress.hosts.host=port.exner.dev \
```
