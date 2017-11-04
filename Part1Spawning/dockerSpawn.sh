#!/bin/sh
cd /Users/pmukher/Desktop/NC\ State/DevOps/HW5
echo "Trying to create a docker container."
docker build -t $2 .
docker run -p $1:$1 -d $2
