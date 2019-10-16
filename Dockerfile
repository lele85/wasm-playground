FROM alpine:edge

RUN apk add --update --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    clang \
    llvm9 \
    lld \
    wabt \
    caddy
