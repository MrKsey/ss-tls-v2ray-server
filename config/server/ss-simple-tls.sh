#!/bin/bash
# description: shadowsocks+simple-tls server

# Source function library.
. $CONFIG_PATH/.config.env

start() {
    simple-tls -b :443 -d 127.0.0.1:8443 -s -key $CONFIG_PATH/server/simple-tls_cert.key -cert $CONFIG_PATH/server/simple-tls_cert.cert &
}

stop() {
    pkill simple-tls
}

status() {
    lsof -i -P -n | grep simple-tl
}

case "$1" in 
    start)
       start
       ;;
    stop)
       stop
       ;;
    restart)
       stop
       start
       ;;
    status)
       status
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 