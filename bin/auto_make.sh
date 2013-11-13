#!/bin/bash
# Run make every second, but only if necessary. Arguments are forwarded to make
# -q and make.
MAKE=make
MAKE_TEST="$MAKE -q"


wait_for_event() {
    inotifywait -qqr -e modify -e attrib .
}


log() {
    [ "$VERBOSE" -lt $1 ] && return
    shift
    echo "$@"
}


args="$(getopt -o inv --longoptions inotify,notify,verbose -- "$@")"
getopt_exit="$?"
if [ "$getopt_exit" -ne 0 ]; then
    echo "$args" >&2
    exit "$getopt_exit"
fi
eval set -- "$args"

VERBOSE=0
while true; do
    case "$1" in
        -i|--inotify) USE_INOTIFY=1; shift ;;
        -n|--notify) USE_NOTIFY=1; shift ;;
        -v|--verbose) VERBOSE=$((VERBOSE + 1)); shift ;;
        --) shift; break ;;
    esac
done


while true; do
    [ "$USE_INOTIFY" ] && ( log 2 'Waiting for event...'; wait_for_event )
    if ! $MAKE_TEST "$@"; then
        log 1 'making...'
        $MAKE "$@"
        make_exit="$?"
        [ "$make_exit" -eq 0 ] || log 1 "Make exit code: $make_exit"
        log 1 'made'
        [ "$USE_NOTIFY" ] && notify-send -t 1000 make made
        [ ! "$USE_INOTIFY" ] && ( log 2 'Waiting a second...'; sleep 1s )
    fi
done
