FROM alpine:latest as builder

COPY bin/* /root

WORKDIR /root

RUN set -eux; \
    apkArch="$(apk --print-arch)"; \
    case "$apkArch" in \
        x86_64)  binArch='amd64';; \
        aarch64) binArch='arm64';; \
        armv7)   binArch="arm";; \
        *) echo >&2 "error: unsupported architecture ($apkArch)"; exit 1;; \
    esac; \
    mv caddy-${binArch} caddy

FROM caddy:latest

COPY --from=builder /root/caddy /usr/bin/caddy