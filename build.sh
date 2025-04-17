#!/bin/bash

# Build Docker image
echo "Building Docker image..."
docker build -t devops-build:latest .

# Tag image for Docker Hub (replace <your-dockerhub-username> with your Docker Hub username)
echo "Tagging image..."
docker tag devops-build:latest <sudharsan30>/devops-build:latest

echo "Build complete."
