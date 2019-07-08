#!/bin/bash
# Build subtrees of the kustomization to work around "multiple matches" bugs in Kustomize.
# https://github.com/kubernetes-sigs/kustomize/issues?utf8=%E2%9C%93&q=%22multiple+matches%22

set -e

echo '---'; kz3 build cluster/dns
echo '---'; kz3 build cluster/ingress/private
echo '---'; kz3 build cluster/ingress/public
echo '---'; kz3 build cluster/network
echo '---'; kz3 build cluster/storage
