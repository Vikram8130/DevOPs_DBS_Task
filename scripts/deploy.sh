#!/bin/bash

echo "to use local docker images in Minikube"

eval $(minikube -p minikube docker-env)

echo "build and tag the docker image"

sudo docker build -t google-checker .

sudo docker tag google-checker google-checker:latest

function deploy() {
    echo "Deploying application..."
    kubectl apply -f Kubernetes/deployment.yaml -n status-checker
    kubectl apply -f Monitoring/prometheus-configmap.yaml -n monitoring
    kubectl apply -f Monitoring/prometheus-deployment.yaml -n monitoring
    kubectl apply -f Monitoring/grafana-deployment.yaml -n monitoring
    kubectl apply -f Monitoring/grafana-datasource-prometheus-configmap.yaml -n monitoring    
}

function teardown() {
    echo "Tearing down application..."
    kubectl delete -f Kubernetes/deployment.yaml -n status-checker
    kubectl delete -f Monitoring/prometheus-configmap.yaml -n monitoring
    kubectl delete -f Monitoring/prometheus-deployment.yaml -n monitoring
    kubectl delete -f Monitoring/grafana-deployment.yaml -n monitoring
    kubectl delete -f Monitoring/grafana-datasource-prometheus-configmap.yaml -n monitoring
}

if [ "$1" == "start" ]; then
    deploy
elif [ "$1" == "stop" ]; then
    teardown
else
    echo "Usage: $0 {start|stop}"
fi