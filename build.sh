#!/bin/bash

IMAGE_NAME="sudharsan30/dev"
TAG="latest"

if [ "$1" == "build" ]; then
    echo "Building image: $IMAGE_NAME:$TAG"
    docker build -t $IMAGE_NAME:$TAG .
elif [ "$1" == "push" ]; then
    echo "Logging in to DockerHub..."
    echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USER" --password-stdin

    echo "Pushing image to DockerHub..."
    docker push $IMAGE_NAME:$TAG
else
    echo "Usage: $0 {build|push}"
    exit 1
fi
