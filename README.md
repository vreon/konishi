```
_|                            _|            _|        _|
_|  _|      _|_|    _|_|_|          _|_|_|  _|_|_|
_|_|      _|    _|  _|    _|  _|  _|_|      _|    _|  _|
_|  _|    _|    _|  _|    _|  _|      _|_|  _|    _|  _|
_|    _|    _|_|    _|    _|  _|  _|_|_|    _|    _|  _|

              Welcome to Konishi, Citizen.
```

Configuration for my home Kubernetes cluster.

## Usage

```sh
asdf install
./generate.sh
kustomize build | kubectl apply -f -
```

## Structure

```
.
├── .tool-versions      # Required versions of tools (for asdf-vm)
├── clean.sh            # Deletes generated upstream manifests
├── generate.sh         # Generates bases for all upstream projects
├── infra               # Overlays for basic cluster services
├── kustomization.yaml  # Kustomization for entire cluster
├── README.md           # This file
├── tests               # Manifests for smoke testing
└── upstream            # Base-generator scripts for upstream projects
```
