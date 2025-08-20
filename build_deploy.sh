#!/bin/bash
set -e  # Ha bármelyik parancs hibát ad, a script megáll

# Beállítások
APP_REPO_URL="git@github.com:fbalint2001/flask-app.git"  # SSH URL
APP_DIR="./temp_flask_app"
IMAGE_NAME="flask-app:latest"

# Repo klónozása vagy frissítése
if [ -d "$APP_DIR" ]; then
    echo "Updating existing app repo..."
    cd $APP_DIR
    git pull
    cd ..
else
    echo "Cloning app repo..."
    git clone $APP_REPO_URL $APP_DIR
fi

# Docker image build
docker build -t $IMAGE_NAME -f ./Dockerfile $APP_DIR

# Kubernetes deploy
kubectl apply -f deployment.yaml

# Rollout restart, hogy frissüljön a pod
kubectl rollout restart deployment flask-app

echo "Build and deploy completed!"

