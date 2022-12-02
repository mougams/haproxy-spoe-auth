#!/bin/bash

function help {
        echo "Syntax:"
        echo  `basename $0` "-c <configuration>"
        echo "  <configuration> : Configuration file name. Format in yaml"
        echo "  help: Display syntax help"
}

while getopts "c:h" OPTION
do
        case $OPTION in
                c) CONFIGURATION="$OPTARG";;
                h) help;exit 0;
        esac
done

if [ -z "${CONFIGURATION}" ]
then
    echo "A configuration file must be specified"
    exit 1
fi

if [[ "$DEBUG_ENABLED" -eq "1" ]]
then
    echo "Running agent along with debug server"
    /scripts/run-with-debug.sh haproxy-spoe-auth cmd/haproxy-spoe-auth/main.go -- \
        -config $CONFIGURATION
else
    while true
    do
        echo "Running agent without debug server"
        go run cmd/haproxy-spoe-auth/main.go -config $CONFIGURATION
        sleep 2
    done
fi
