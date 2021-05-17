#!/bin/bash

export CADDY_VERSION=v2.4.0

linuxArch=("amd64" "386" "arm64" "ppc64le")
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

unsupportUPX=("s390x")
for arch in "${unsupportUPX[@]}"; do
    GOOS=linux GOARCH=${arch} xcaddy build \
        --with github.com/WingLim/caddy-webhook \
        --output ubin/caddy-"${arch}"
done