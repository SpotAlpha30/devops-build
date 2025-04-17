#!/bin/bash

# Stop and remove existing containers
echo "Stopping and removing existing containers..."
docker compose down

# Pull the latest image (optional, if using Docker Hub)
# docker pull <your-dockerhub-username>/devops-build:latest

# Deploy the application
echo "Deploying application..."
docker compose up -d

echo "Deployment complete."
