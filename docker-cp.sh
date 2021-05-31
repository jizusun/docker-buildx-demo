#!/usr/bin/env bash

id=$(docker run -itd jizu/multiarch-example:latest sh)

docker cp $id:/root/main main
file main
./main

docker stop $id
docker rm -v $id

# docker kill $(docker ps -q) &&  docker rm $(docker ps -a -q)          