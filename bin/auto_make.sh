#!/bin/bash

# Run make every second, but only if necessary. Arguments are forwarded to make
# -q and make.

while true; do
    make -q "$@" || make "$@" && sleep 1s
done
