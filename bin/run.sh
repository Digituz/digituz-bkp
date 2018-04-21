#!/usr/bin/env bash

# update local repo
git pull

# pull latests images
docker-compose pull

# build images
docker-compose build

# build both images (gateway and proxy)
docker-compose up
