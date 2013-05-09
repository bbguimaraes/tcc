#!/bin/bash

# Run make every second, but only if necessary. Arguments are forwarded to make
# -q and make.

make=make\ "$@"
make_test=$make\ -q

while true; do
    $make_test -q "$@" || $make && sleep 1s
done
