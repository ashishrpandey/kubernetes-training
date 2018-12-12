## Install MiniKube
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.31.0/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube

## Check the version of minikube

    minikube version

# Start the K8 cluster 
    minikube start 		

## install kubectl 

    sudo yum install kubectl

    kubectl version

## Get information about the cluster
    kubectl cluster-info 


## Get information about the nodes
    kubectl get nodes

## Run a sample container (name =  kubernetes-bootcamp)
    kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080

    kubectl get deployments

### ON a different terminal Run:
    kubectl proxy

### To verify that it is working properly, On the other terminal Run :
    curl http://localhost:8001/version
    export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
    echo Name of the Pod: $POD_NAME
    curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/

   
