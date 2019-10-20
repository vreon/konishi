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
kustomize build cluster | kubectl apply -f -
```

#### Checking for updates

Requires [nvchecker](https://github.com/lilydjwg/nvchecker).

```
nvchecker versions/config.ini      # Check for new versions
nvtake versions/config.ini <name>  # Mark <name> as updated
```

## Structure

```
.
├── .tool-versions      # Required versions of tools (for asdf-vm)
├── clean.sh            # Deletes generated upstream manifests
├── generate.sh         # Generates bases for all upstream projects
├── cluster             # Overlay for entire cluster
├── README.md           # This file
├── tests               # Manifests for smoke testing
├── upstream            # Base-generator scripts for upstream projects
└── versions            # Tracks versions of upstream projects
```
