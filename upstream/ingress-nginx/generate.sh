#!/bin/bash

set -e

curl -s https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.24.1/deploy/mandatory.yaml > mandatory.yaml

touch kustomization.yaml
kz3 edit add resource mandatory.yaml
