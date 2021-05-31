#!/usr/bin/env bash

id=$(docker run -itd jizu/multiarch-example:latest sh)

mkdir bin

docker cp $id:/root/main bin/main
file ./bin/main
./bin/main


docker stop $id
docker rm -v $id

# docker kill $(docker ps -q) &&  docker rm $(docker ps -a -q)          