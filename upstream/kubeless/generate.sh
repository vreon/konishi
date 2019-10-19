#!/bin/bash

set -e

curl -sL https://github.com/kubeless/kubeless/releases/download/v1.0.5/kubeless-v1.0.5.yaml \
    > kubeless.yaml

touch kustomization.yaml
kustomize edit add resource kubeless.yaml
