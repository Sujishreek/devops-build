#!/bin/bash

# Navigate to project root (if needed)
cd "$(dirname "$0")/.."

# Build Docker image from the build folder
docker build -t your-image-name ./build

