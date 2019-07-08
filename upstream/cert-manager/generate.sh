#!/bin/bash

set -e

curl -Ls https://github.com/jetstack/cert-manager/releases/download/v0.8.1/cert-manager.yaml > cert-manager.yaml

touch kustomization.yaml
kz3 edit add resource cert-manager.yaml
