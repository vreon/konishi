#!/bin/bash
# Build subtrees of the kustomization to work around "multiple matches" bugs in Kustomize.
# https://github.com/kubernetes-sigs/kustomize/issues?utf8=%E2%9C%93&q=%22multiple+matches%22

set -e

echo '---'; kz3 build infra/dns
echo '---'; kz3 build infra/ingress/private
echo '---'; kz3 build infra/ingress/public
echo '---'; kz3 build infra/network
echo '---'; kz3 build infra/storage
echo '---'; kz3 build infra/tls
