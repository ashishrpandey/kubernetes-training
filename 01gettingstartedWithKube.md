## Getting started with Kubernetes
### run a container
    docker run --name kubia-container -p 8080:8080 -d luksa/kubia

### See the effect 
    curl localhost:8080

### Run a pseudo bash shell
    docker exec -it kubia-container bash

### If you have already setup the cluster 
    kubectl cluster-info

### Get info about your nodes
    kubectl describe node <node-name>

### To make life easy do the folllowing
    source <(kubectl completion bash)
    echo "source <(kubectl completion bash)" >> ~/.bashrc 

### Deploy the pod through a replication controller
    kubectl run kubia --image=luksa/kubia --port=8080 --generator=run/v1

### Get rc
    kubectl get rc

### Get svc 
    kubectl get svc

### Exposing that as a web service
    kubectl expose rc kubia --type=NodePort --name kubia-http
 
### Checkout the svc for the exposed port
    kubectl get svc
 
Checkout on browser <public ip>:<port>
it shall show the output from pod for public ip of all masters and all nodes
 
## Scale the srvice
    kubectl scale rc kubia --replicas=3

## Get all pods with more info 
    kubectl get pods -o wide

## get description
    kubectl describe pod <podname>
