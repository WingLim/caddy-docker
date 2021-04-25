#!/bin/bash

linuxArch=("amd64" "386" "arm64" "ppc64le" "s390x")
for arch in "${linuxArch[@]}"; do
    GOOS=linux GOARCH=${arch} xcaddy build \
          --with github.com/WingLim/caddy-webhook \
          --output bin/caddy-"${arch}"
done

armVersion=("6" "7")
for ver in "${armVersion[@]}"; do
    GOOS=linux GOARCH=arm GOARM=${ver} xcaddy build \
          --with github.com/WingLim/caddy-webhook \
          --output bin/caddy-armv"${ver}"
done