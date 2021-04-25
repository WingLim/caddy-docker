#!/bin/bash

for arch in "amd64" "arm64" "arm"; do
    GOOS=linux GOARCH=${arch} xcaddy build \
          --with github.com/WingLim/caddy-webhook \
          --output bin/caddy-${arch}
done