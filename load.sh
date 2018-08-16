#!/bin/bash

dock=$(docker ps -a | grep 'vimdock' | awk '{print $2}')

if [ -n "$dock" ]; then
    echo 'Found vimdock image, failed to load the image... '
    exit 1
fi

if [ -z "$1" ]; then
    echo 'Usage: '$0' [compressed file]'
    exit 1
fi

file=$1

if [ ! -f "$file" ]; then
    echo 'Unable to open file... file: '$file
    exit 1
fi

set -e

echo "Loading backup image..."

gzip -d -c "${file}" | docker load
