#!/bin/bash

TERMINATE=?
while getopts t OPT; do
    case $OPT in
        t) TERMINATE=true         ;;
        *) print_help; exit 1     ;;
    esac
done

if [ $TERMINATE = true ]; then
    docker stop rstudio
    exit 0
fi

open http://localhost:9001
