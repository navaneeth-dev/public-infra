ARG VERSION="2.8.4"

FROM caddy:$VERSION-builder AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:$VERSION

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile

CMD ["/usr/bin/caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
