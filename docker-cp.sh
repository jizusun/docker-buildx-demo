#!/usr/bin/env bash

docker pull jizu/multiarch-github-actions:latest 
id=$(docker run -itd jizu/multiarch-github-actions:latest sh)
docker cp $id:/root/main main
# file main
# ./main
docker stop $id
docker rm -v $id

# docker kill $(docker ps -q) &&  docker rm $(docker ps -a -q)          