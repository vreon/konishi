#!/bin/bash

set -e

curl -s https://docs.projectcalico.org/v3.8/manifests/calico.yaml > calico.yaml

touch kustomization.yaml
kz3 edit add resource calico.yaml
