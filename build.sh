#!/bin/sh
echo Building celtra/multi:build

docker build -t celtra/multi:build . -f Dockerfile.build

docker container create --name extract celtra/multi:build
docker container cp extract:/app ./extracted  
docker container rm -f extract

echo Building celtra/multi:3rd

docker build --no-cache -t celtra/multi:3rd .
rm -rf ./extracted
