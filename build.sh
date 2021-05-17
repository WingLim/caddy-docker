#!/bin/bash

export CADDY_VERSION=v2.4.0

function build() {
    export $1
    export $2
    xcaddy build \
        --with github.com/WingLim/caddy-webhook \
        --output $3
}

linuxArch=("amd64" "386" "arm64" "ppc64le")
for arch in "${linuxArch[@]}"; do
    build GOOS=linux GOARCH=${arch} bin/caddy-"${arch}"
done

armVersion=("6" "7")
for ver in "${armVersion[@]}"; do
    build GOARCH=arm GOARM=${ver} bin/caddy-armv"${ver}"
done

unsupportUPX=("s390x")
for arch in "${unsupportUPX[@]}"; do
    build GOOS=linux GOARCH=${arch} ubin/caddy-"${arch}"
done