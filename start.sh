#!/bin/bash

# Railpack start script for microservices application
# This script determines which service to start based on environment variables

set -e

echo "Starting microservices application..."

# Check if SERVICE_NAME is set to determine which service to start
if [ -z "$SERVICE_NAME" ]; then
    echo "SERVICE_NAME not set. Starting activity-service as default."
    SERVICE_NAME="activity-service"
fi

case "$SERVICE_NAME" in
    "auth-service")
        echo "Starting Auth Service..."
        cd auth-service
        npm install --production
        npm start
        ;;
    "task-service")
        echo "Starting Task Service..."
        cd task-service
        npm install --production
        npm start
        ;;
    "activity-service")
        echo "Starting Activity Service..."
        cd activity-service
        npm install --production
        npm start
        ;;
    "log-service")
        echo "Starting Log Service..."
        cd log-service
        npm install --production
        npm start
        ;;
    *)
        echo "Unknown service: $SERVICE_NAME"
        echo "Available services: auth-service, task-service, activity-service, log-service"
        exit 1
        ;;
esac