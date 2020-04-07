FROM alpine:3.5
RUN apk add --no-cache --virtual .build-deps curl \
 && mkdir /etc/caddy \
 && touch /etc/caddy/Caddyfile \
 && curl -L -o /caddy.tar.gz --insecure https://github.com/caddyserver/caddy/releases/download/v1.0.3/caddy_v1.0.3_linux_amd64.tar.gz \
 && tar -zxvf /caddy.tar.gz caddy \
 && mv caddy /usr/bin \
 && rm -rf /caddy*
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh
