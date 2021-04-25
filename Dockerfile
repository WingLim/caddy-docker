FROM caddy:latest

ARG arch

COPY bin/caddy-${arch} /usr/bin/caddy