#!/bin/bash

# description: logagent
# chkconfig: 2345 80 20

prefix="/usr/local/logagent"
config="$prefix/logagent.conf"
logagent="$prefix/bin/logagent"
pidfile="/var/run/logagent.pid"
prog="logagent"

. /etc/rc.d/init.d/functions

start() {
    echo -n $"Starting $prog:"
    nohup $logagent --conf $config &> /dev/null &
    retval=$?
    if [ $retval -eq 0 ]; then
        success
        echo
    else
        failure
        echo
    fi
    return $retval
}

status() {
    if [ -f $pidfile ]; then
        pid=$(cat $pidfile)
        echo "logagent is running, pid is: $pid"
    else
        echo "logagent is not running"
    fi
}

stop() {
    if [ -f $pidfile ]; then
        echo -n $"Stopping $prog:"
        killproc $prog
        echo
    else
        echo "$prog is not running"
    fi
}

case "$1" in
    start)
        start;;
    status)
        status;;
    stop)
        stop;;
    *)
        echo $"Usage: $0 {start|stop|status}"
        ;;
esac