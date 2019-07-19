
Clone the repo - 
 
     git clone https://github.com/bibinwilson/kubernetes-prometheus
     cd kubernetes-prometheus/
     
Create a namespace for monitoring

     kubectl create namespace monitoring

Create Cluster role, Config, and deployment

     kubectl apply -f clusterRole.yaml
     kubectl create -f config-map.yaml -n monitoring
     kubectl create  -f prometheus-deployment.yaml --namespace=monitoring

Wait for around 8 minutes to get the pod Ready 

     kubectl get deployments --namespace=monitoring
     kubectl get pods  --namespace=monitoring

Then create service   

    kubectl apply -f prometheus-service.yaml
     kubectl get svc --namespace=monitoring

Open in browser:

    <publicip>:30000


Reference: 
https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/
