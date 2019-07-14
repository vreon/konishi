#!/bin/bash

set -e

curl -Ls https://github.com/strimzi/strimzi-kafka-operator/releases/download/0.12.1/strimzi-cluster-operator-0.12.1.yaml \
    > strimzi-cluster-operator.yaml

touch kustomization.yaml
kustomize edit add resource strimzi-cluster-operator.yaml
