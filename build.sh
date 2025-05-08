#!/bin/bash
# Build Docker image
IMAGE_NAME=$1
TAG=$2
if [ -z "$IMAGE_NAME" ] || [ -z "$TAG" ]; then
echo "Usage: $0 <image_name> <tag>"
exit 1
fi

echo "Building image: $IMAGE_NAME:$TAG"
docker build -t "$IMAGE_NAME:$TAG" .
if [ $? -ne 0 ]; then
echo "Failed to build $IMAGE_NAME:$TAG. Exiting."
exit 1
fi

echo "Build complete."
