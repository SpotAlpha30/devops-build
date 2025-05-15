#!/bin/bash

IMAGE_NAME="sudharsan30/dev"
TAG="latest"

echo "Building image: $IMAGE_NAME:$TAG"
docker build -t $IMAGE_NAME:$TAG .

echo "Logging in to DockerHub..."
echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USER" --password-stdin

echo "Pushing image to DockerHub..."
docker push $IMAGE_NAME:$TAG
