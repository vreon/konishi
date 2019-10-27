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

Requires several unreleased kustomize plugins (for now you can look at the
generators at least :eyes:).

#### Configure tools

```sh
asdf install
./setup.sh
```

#### Checking for updates

Requires [nvchecker](https://github.com/lilydjwg/nvchecker).

```
nvchecker versions/config.ini      # Check for new versions
nvtake versions/config.ini <name>  # Mark <name> as updated
```

#### Applying updates

```
kustomize build --enable_alpha_plugins cluster | kubectl apply -f -
```

## Structure

```
.
├── .tool-versions      # Required versions of tools (for asdf-vm)
├── cluster             # Overlay for entire cluster
├── README.md           # This file
├── setup.sh            # Configure Helm
├── tests               # Manifests for smoke testing
└── versions            # Tracks versions of upstream projects
```
