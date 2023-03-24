#!/bin/bash

name=$1
port=$2

cd ~/techtonic
touch "wiki_$name.sqlite"

docker run --name "wiki_$name" -d -e DB_TYPE=sqlite -e DB_FILEPATH="./wiki_$name.sqlite" --mount type=bind,source="./wiki_$name.sqlite",target=/wiki/wiki.sqlite -p "$port":3000 ghcr.io/requarks/wiki:latest
