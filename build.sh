#!/bin/bash
# Build subtrees of the kustomization to work around "multiple matches" bugs in Kustomize.
# https://github.com/kubernetes-sigs/kustomize/issues?utf8=%E2%9C%93&q=%22multiple+matches%22

set -e

for overlay in \
    infra/dns \
    infra/ingress/private \
    infra/ingress/public \
    infra/monitoring \
    infra/network \
    infra/storage \
    infra/tls \
; do
    echo '---'
    kustomize build $overlay
done
