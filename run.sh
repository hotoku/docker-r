#!/bin/bash


PORT=8787
VOLUME=$(pwd)
PASSWORD=hotoku

while getopts p:v:q: OPT; do
    case ${OPT} in
        p) PORT=${OPTARG}     ;;
        v) VOLUME=${OPTARG}   ;;
        q) PASSWORD=${OPTARG} ;;
        *) exit 1             ;;
    esac
done


DOCKER=/usr/local/bin/docker
${DOCKER} run -d --rm -e PASSWORD=${PASSWORD} -v ${VOLUME}:/home/rstudio -p ${PORT}:8787 hotoku/r
