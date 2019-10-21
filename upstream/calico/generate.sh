#!/bin/bash

set -e

curl -s https://docs.projectcalico.org/v3.10/manifests/calico.yaml > calico.yaml

touch kustomization.yaml
kustomize edit add resource calico.yaml
