#!/bin/bash

curl -s https://raw.githubusercontent.com/kubernetes-incubator/external-dns/v0.5.15/docs/tutorials/aws.md | \
    sed -n '101,161p' \
    > external-dns.yaml

touch kustomization.yaml
kz3 edit add resource external-dns.yaml
kz3 edit set image registry.opensource.zalan.do/teapot/external-dns:v0.5.15
