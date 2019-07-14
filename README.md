```
_|                            _|            _|        _|
_|  _|      _|_|    _|_|_|          _|_|_|  _|_|_|
_|_|      _|    _|  _|    _|  _|  _|_|      _|    _|  _|
_|  _|    _|    _|  _|    _|  _|      _|_|  _|    _|  _|
_|    _|    _|_|    _|    _|  _|  _|_|_|    _|    _|  _|

              Welcome to Konishi, Citizen.
```

Configuration for my home Kubernetes cluster.

Requires [kustomize](https://github.com/kubernetes-sigs/kustomize) v3.0.2.

## Usage

```sh
./generate.sh
kustomize build | kubectl apply -f -
```

## Structure

```
.
├── clean.sh            # Deletes generated upstream manifests
├── generate.sh         # Generates bases for all upstream projects
├── infra               # Contains overlays for basic cluster services
├── kustomization.yaml  # Kustomization for entire cluster
├── README.md           # This file
├── tests               # Contains misc. manifests for smoke testing
└── upstream            # Contains base-generator scripts for upstream projects
```
