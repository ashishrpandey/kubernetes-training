## Download Istio

    curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.0.0 sh -
    
    export PATH="$PATH:/root/istio-1.0.0/bin"

    cd /root/istio-1.0.0

## Create CRDs
Deploy the extensions by applying crds.yaml - 
 
    kubectl apply -f install/kubernetes/helm/istio/templates/crds.yaml -n istio-system
 
 Wait for some time. List out all the CRDs created for Istio 
 
     kubectl api-resources|grep -i istio
 
 
## Install Istio with default mutual TLS authentication:
 This will deploy Pilot, Mixer, Ingress-Controller, and Egress-Controller, and the Istio CA (Certificate Authority).
 
    kubectl apply -f install/kubernetes/istio-demo-auth.yaml

## Check status
All the services are deployed as Pods.

    kubectl get pods -n istio-system
 
## Deploy Sample Application

    kubectl apply -f <(istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml)

## Deploy gateway - 

    kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

Check Status

    kubectl get pods

## Apply default destination rules
Before you can use Istio to control the Bookinfo version routing, you need to define the available versions, called subsets, in destination rules.

    kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml

## Control Routing
One of the main features of Istio is its traffic management. As a Microservice architectures scale, there is a requirement for more advanced service-to-service communication control.

## User Based Testing / Request Routing
One aspect of traffic management is controlling traffic routing based on the HTTP request, such as user agent strings, IP address or cookies.

The example below will send all traffic for the user "jason" to the reviews:v2, meaning they'll only see the black stars.

    cat samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml

Similarly to deploying Kubernetes configuration, routing rules can be applied using istioctl.
