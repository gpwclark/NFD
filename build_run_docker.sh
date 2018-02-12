#!/bin/bash

docker build -t nfd .
docker run -d --name nfdd -p 6363:6363 nfd
