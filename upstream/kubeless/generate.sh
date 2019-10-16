#!/bin/bash

set -e

curl -sL https://github.com/kubeless/kubeless/releases/download/v1.0.4/kubeless-v1.0.4.yaml | \
    sed 's/apps\/v1beta1/apps\/v1/g' | \
    sed 's/kubeless\/function-controller:v1.0.4/kubeless\/function-controller:build-30de1835-37dc-40be-92c3-d3d73464d975/g' \
    > kubeless.yaml

touch kustomization.yaml
kustomize edit add resource kubeless.yaml
