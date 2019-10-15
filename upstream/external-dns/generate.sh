#!/bin/bash

set -e

curl -s https://raw.githubusercontent.com/kubernetes-incubator/external-dns/v0.5.17/docs/tutorials/aws.md | \
    sed -n '101,161p' |
    sed 's/extensions\/v1beta1/apps\/v1/' \
    > external-dns.yaml

cat <<EOF > set-selector.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: external-dns
spec:
  selector:
    matchLabels:
      app: external-dns
EOF

touch kustomization.yaml
kustomize edit add resource external-dns.yaml
kustomize edit add patch set-selector.yaml
kustomize edit set image registry.opensource.zalan.do/teapot/external-dns:v0.5.17
