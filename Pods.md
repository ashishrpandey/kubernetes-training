## create the pod from your YAML file, use the kubectl create command:
    kubectl create -f kubia-manual.yaml

## Get pod description:
    kubectl get po kubia-zxzij -o yaml
 
## when creating a pod manifest from scratch, you can start by asking kubectl to explain pods:
    kubectl explain pods
    kubectl explain pods.spec 
 

 
 ## Log of specififc container
    docker logs <container id>
     kubectl logs kubia-manual
    kubectl logs kubia-manual -c kubia

# Enable Port forwarding
     kubectl port-forward kubia-manual 8888:8080

### In a different terminal, you can now use curl to send an HTTP request to your 
### pod through the kubectl port-forward proxy running on localhost:8888:
    curl localhost:8888

## Providing Labels

    kubectl create -f kubia-manual-with-labels.yaml
 
 ### The kubectl get pods command doesn’t list any labels by default, but you can see them by using the --show-labels switch:
 
    kubectl get po --show-labels

### Instead of listing all labels, if you’re only interested in certain labels,
### you can specify them with the -L switch and have each displayed in its own column

    kubectl get po -L creation_method,env



##  Modifying labels of existing pods
## Because the kubia-manual pod was also created manually, let’s add the creation_method=manual label to it:
    kubectl label po kubia-manual creation_method=manual

## Listing pods using a label selector
    kubectl get po -l creation_method=manual
## To list all pods that include the env label, whatever its value is:

    kubectl get po -l env

## And those that don’t have the env label:
    kubectl get po -l '!env'
 
## Using labels for categorizing worker nodes
    kubectl label node gke-kubia-85f6-node-0rrx gpu=true
 
    kubectl get nodes -l gpu=true
 
## Delete a pod
    kubectl delete po <pod_name>
 
## Delete all the pods with label creation_method:manual

    kubectl delete po -l creation_method=manual
 
 
## Annotate a pod
    kubectl annotate pods <podname> creator="Ashish"
 
## see the annotation by urself
    kubectl describe pod <podname>
 
 # namespaces
 ## list all the namespaces
    kubectl get ns
 
## get all pods in a ns
    kubectl get po --namespace kube-system
 
## Create a namespace
    kubectl create -f custom-namespace.yaml
### OR
    kubectl create namespace custom-namespace

## Create a resource specific to a namespace
    kubectl create -f kubia-manual.yaml -n custom-namespace


