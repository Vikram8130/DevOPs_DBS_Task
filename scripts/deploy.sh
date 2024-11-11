#!/bin/bash

echo "to use local docker images in Minikube"

eval $(minikube -p minikube docker-env)

echo "build and tag the docker image"

sudo docker build -t google-checker .

sudo docker tag google-checker google-checker:latest

function deploy() {
    echo "Deploying application..."
    kubectl apply -f Kubernetes/deployment.yaml
    kubectl apply -f Monitoring/prometheus-configmap.yaml
    kubectl apply -f Monitoring/prometheus-deployment.yaml
    kubectl apply -f Monitoring/grafana-deployment.yaml    
}

function teardown() {
    echo "Tearing down application..."
    kubectl delete -f Kubernetes/deployment.yaml
    kubectl delete -f Monitoring/prometheus-configmap.yaml
    kubectl delete -f Monitoring/prometheus-deployment.yaml
    kubectl delete -f Monitoring/grafana-deployment.yaml
}

if [ "$1" == "start" ]; then
    deploy
elif [ "$1" == "stop" ]; then
    teardown
else
    echo "Usage: $0 {start|stop}"
fi