
Deploy the mandatory file from official nginx page 
https://kubernetes.github.io/ingress-nginx/deploy/

        kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.28.0/deploy/static/mandatory.yaml

## Create a service

This will create a service of type LoadBalancer
        
        #kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.28.0/deploy/static/provider/cloud-generic.yaml
        
We have modified the above file to make it ClusterIP service 

        kubectl apply -f ingress-nginx-service.yaml

## Create ingress-rules 

        kubectl apply -f ingress-rules.yaml 
        
## Now deploy our 3 set of deployments and services 

        kubectl apply -f webapp-deployment.yaml

Check that everything is working fine 

        kubectl get svc -n ingress-nginx 
        kubectl get ep -n ingress-nginx
        kubectl get pods -n ingress-nginx 
        kubectl get pods 
        kubectl get ing

Go to one of the pods 


        kubectl exec -it webapp1-66cb4ddfc9-6hkx9  bash   

        curl -H "host: my.kubernetes.example" 10.96.188.215/webapp1
        curl -H "host: my.kubernetes.example" 10.96.188.215/webapp2
        curl -H "host: my.kubernetes.example" 10.96.188.215/webapp3
        

