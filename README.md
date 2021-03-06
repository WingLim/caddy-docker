# caddy-docker

[![build](https://github.com/WingLim/caddy-docker/actions/workflows/build.yml/badge.svg)](https://github.com/WingLim/caddy-docker/actions/workflows/build.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/winglim/caddy)
[![Github Package](https://img.shields.io/static/v1?label=WingLim&message=Github%20Package&color=blue&logo=github)](https://github.com/users/WingLim/packages/container/package/caddy)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/winglim/caddy)

Caddy V2 docker image with modules in multi platforms.

Using Caddy v2.4.0

## Platform

- linux/amd64
- linux/386
- linux/arm64
- linux/arm/v7
- linux/arm/v6
- linux/ppc64le
- linux/s390x

## Modules

This image add modules below:

1. [caddy-webhook](https://github.com/WingLim/caddy-webhook)
2. [caddy-exec](https://github.com/abiosoft/caddy-exec)

## Usage

```shell
docker run -itd \
    -p 80:80 -p 443:443
    -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
    -v $PWD/caddy_data:/data\
    winglim/caddy
```
