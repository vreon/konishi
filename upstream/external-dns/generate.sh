#!/bin/bash

set -e

curl -s https://raw.githubusercontent.com/kubernetes-incubator/external-dns/v0.5.17/docs/tutorials/aws.md | \
    sed -n '101,161p' \
    > external-dns.yaml

touch kustomization.yaml
kustomize edit add resource external-dns.yaml
kustomize edit set image registry.opensource.zalan.do/teapot/external-dns:v0.5.17
