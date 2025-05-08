#!/bin/bash
# Deploy Docker image
IMAGE_NAME=$1
TAG=$2
if [ -z "$IMAGE_NAME" ] || [ -z "$TAG" ]; then
echo "Usage: $0 <image_name> <tag>"
exit 1
fi

echo "Pulling image: $IMAGE_NAME:$TAG"
docker pull "$IMAGE_NAME:$TAG" || true
echo "Stopping and removing existing containers..."
docker-compose down
echo "Deploying application..."
TAG="$TAG" docker-compose up -d
echo "Deployment complete."
