#!/bin/bash

set -e

curl -Ls https://github.com/jetstack/cert-manager/releases/download/v0.11.0/cert-manager.yaml > cert-manager.yaml

touch kustomization.yaml
kustomize edit add resource cert-manager.yaml
