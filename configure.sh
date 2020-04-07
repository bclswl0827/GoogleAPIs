#!/bin/sh
cat << EOF > /etc/caddy/Caddyfile
0.0.0.0:${PORT} {
    proxy / https://www.googleapis.com
}
EOF
/usr/bin/caddy --conf=/etc/caddy/Caddyfile
