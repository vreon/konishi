#!/bin/bash

set -e

curl -sL https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.11/deploy/local-path-storage.yaml \
    > local-path-provisioner.yaml

touch kustomization.yaml
kustomize edit add resource local-path-provisioner.yaml
