#!/bin/bash

linuxArch=("amd64" "arm64" "arm" "ppc64le")
for arch in "${linuxArch[@]}"; do
    GOOS=linux GOARCH=${arch} xcaddy build \
          --with github.com/WingLim/caddy-webhook \
          --output bin/caddy-"${arch}"
done