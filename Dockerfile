FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/WingLim/caddy-webhook

RUN set -eux; \
    apkArch="$(apk --print-arch)"; \
    case "$apkArch" in \
        x86_64)  binArch='amd64'; UPX=1;; \
        aarch64) binArch='arm64'; UPX=0;; \
        armv7)   binArch="arm"; UPX=1;; \
        *) echo >&2 "error: unsupported architecture ($apkArch)"; exit 1;; \
    esac; \
    if [ ${UPX} = 1 ]; then \
    wget "https://github.com/upx/upx/releases/download/v3.96/upx-3.96-${binArch}_linux.tar.xz"; \
    tar xf upx-3.96-${binArch}_linux.tar.xz; \
    mv upx-3.96-${binArch}_linux/upx /usr/bin/upx; \
    chmod +x /usr/bin/upx; \
    upx -v /usr/bin/caddy; \
    fi

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy