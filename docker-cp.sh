#!/usr/bin/env bash

id=$(docker run -itd jizu/multiarch-example:latest sh)
docker cp $id:/root/main bin/main
./bin/main
docker stop $id
docker rm -v $id

# docker kill $(docker ps -q) &&  docker rm $(docker ps -a -q)          