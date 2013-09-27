#!/bin/bash

# Run make every second, but only if necessary. Arguments are forwarded to make
# -q and make.

make=make
make_test=$make\ -q

while true; do
    if ! $make_test "$@"; then
        echo making...
        $make "$@"
        echo made
        notify-send -t 1000 make made
        sleep 1s
    fi
done
