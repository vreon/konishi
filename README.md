```
_|                            _|            _|        _|
_|  _|      _|_|    _|_|_|          _|_|_|  _|_|_|
_|_|      _|    _|  _|    _|  _|  _|_|      _|    _|  _|
_|  _|    _|    _|  _|    _|  _|      _|_|  _|    _|  _|
_|    _|    _|_|    _|    _|  _|  _|_|_|    _|    _|  _|

              Welcome to Konishi, Citizen.
```

Configuration for my home Kubernetes cluster.

Requires [kustomize](https://github.com/kubernetes-sigs/kustomize) v3.

## Usage

```sh
./generate.sh
./build.sh | kubectl apply -f -
```

## Structure

```
.
├── build.sh     # Wraps `kustomize build` to fix a conflict bug
├── clean.sh     # Deletes generated upstream manifests
├── generate.sh  # Generates bases for all upstream projects
├── infra        # Contains overlays for basic cluster services
├── README.md    # This file
├── tests        # Contains misc. manifests for smoke testing
└── upstream     # Contains base-generator scripts for upstream projects
```
