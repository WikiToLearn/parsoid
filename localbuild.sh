#!/bin/bash
cd $(dirname "$(readlink -f $0)")
docker build -t wikitolearn/parsoid:$(cat new_docker_image_version) .
