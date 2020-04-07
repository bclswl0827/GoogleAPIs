FROM alpine:3.5
RUN apk add --no-cache --virtual .build-deps curl \
 && mkdir /etc/caddy \
 && touch /etc/caddy/Caddyfile \
 && curl -L -o /caddy.tar.gz --insecure https://github.com/caddyserver/caddy/releases/download/v1.0.3/caddy_v1.0.3_linux_amd64.tar.gz \
 && tar -zxvf /caddy.tar.gz caddy \
 && mv caddy /usr/bin \
 && echo -e "0.0.0.0:$PORT {\n    proxy / https://www.googleapis.com\n}" > /etc/caddy/Caddyfile \
 && rm -rf /caddy*
CMD ["/usr/bin/caddy", "--conf=/etc/caddy/Caddyfile"]
EXPOSE 80
