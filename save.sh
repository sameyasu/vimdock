#!/bin/bash

dock=$(docker ps -a | grep 'vimdock' | awk '{print $2}')

if [ -z "$dock" ]; then
    echo 'Not found vimdock image, failed to save the image... '
    exit 1
fi

set -e

file=$(date +%Y%m%d%H%M%S).tar.gz
echo "Creating backup image..."

docker save "${dock}" | gzip > "${file}"

echo "Created ${file}"
