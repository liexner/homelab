```
helm repo add hashicorp https://helm.releases.hashicorp.com

helm repo update

helm upgrade --install --create-namespace -n vault vault hashicorp/vault -f values.yml


k exec -n vault --stdin=true --tty=true pod/vault-0 -- vault operator init

kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator unseal <key>

```

```
k exec -n vault  -it  vault-0 -- sh

vault login

vault secrets enable -path=internal kv-v2

vault kv put internal/test/config lmao="linus1337"

vault write auth/kubernetes/config kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443"

vault policy write internal-app - <<EOF
path "internal/data/test/config" {
  capabilities = ["read"]
}
EOF

vault write auth/kubernetes/role/internal-app \
    bound_service_account_names=internal-app \
    bound_service_account_namespaces=testing \
    policies=internal-app \
    ttl=24h

exit
```

kubectl create sa internal-app 