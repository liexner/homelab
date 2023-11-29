```
helm repo add longhorn https://charts.longhorn.io &&
helm repo update &&

helm upgrade -i longhorn longhorn/longhorn --create-namespace -n longhorn --set defaultSettings.defaultReplicaCount=1

helm uninstall longhorn -n longhorn
```

