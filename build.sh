#!/bin/bash

export CADDY_VERSION=v2.4.0

tag=$1
if [[ $tag == "" ]]; then
tag="latest"
fi

echo $tag

function build() {
    export $2
    export $3
    xcaddy build \
        --with github.com/WingLim/caddy-webhook@$1 \
        --with github.com/abiosoft/caddy-exec \
        --output $4
}

linuxArch=("amd64" "386" "arm64" "ppc64le")
for arch in "${linuxArch[@]}"; do
    build $tag GOOS=linux GOARCH=${arch} bin/caddy-"${arch}"
done

armVersion=("6" "7")
for ver in "${armVersion[@]}"; do
    build $tag GOARCH=arm GOARM=${ver} bin/caddy-armv"${ver}"
done

unsupportUPX=("s390x")
for arch in "${unsupportUPX[@]}"; do
    build $tag GOOS=linux GOARCH=${arch} ubin/caddy-"${arch}"
done