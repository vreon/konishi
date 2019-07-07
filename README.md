# konishi

Configuration for my home cluster.

## Usage

```bash
./generate.sh  # Generate manifests from versioned upstream resources
./build.sh | kubectl apply -f -  # Update cluster resources
```

Requires [kustomize](https://github.com/kubernetes-sigs/kustomize) v3.x on the path as `kz3`.
