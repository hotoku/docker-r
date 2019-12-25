#!/bin/bash


PORT=8787
VOLUME=?
PASSWORD=x
while getopts p:v:q: OPT; do
    case ${OPT} in
        p) PORT=${OPTARG}     ;;
        v) VOLUME=${OPTARG}   ;;
        q) PASSWORD=${OPTARG} ;;
        *) exit 1             ;;
    esac
done

if [ -d ${VOLUME} ]; then
    VOLUME_OP="-v ${VOLUME}:/home/rstudio"
fi


DOCKER=/usr/local/bin/docker
${DOCKER} run --rm \
          -e PASSWORD=${PASSWORD} \
          ${VOLUME_OP} \
          -p ${PORT}:8787 \
          --name rstudio \
          hotoku/r
