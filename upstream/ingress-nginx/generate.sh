#!/bin/bash

set -e

curl -s https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.1/deploy/static/mandatory.yaml > mandatory.yaml

touch kustomization.yaml
kustomize edit add resource mandatory.yaml
