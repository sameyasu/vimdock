#!/bin/bash

dock=$(docker ps -a -f status=running | sed -e '1d' | grep 'vimdock')

if [ -z "$dock" ]; then
    echo 'Not running vimdock, starting ... '
    docker-compose up -d
    sleep 1
fi

docker-compose exec vimdock zsh --login
