#!/usr/bin/env bash

# update local repo
git pull

# build both images (gateway and proxy)
docker-compose up
