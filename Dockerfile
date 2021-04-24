FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/WingLim/caddy-webhook

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy