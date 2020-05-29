## Playing with services 

 ## Cluster-IP Service

    kubectl create -f kubia-svc.yaml

    kubectl get svc
     NAME         CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
    kubernetes   10.111.240.1     <none>        443/TCP   30d
    kubia        10.111.249.153   <none>        80/TCP    6m    

Run a pod with matching labels (app=kubia)
     
     kubectl apply -f kubia-pod.yaml
     
Run a curl command from within the pod 
 (replace with your pod-name and cluster-ip)

    kubectl exec kubiapod -- curl -s http://10.111.249.153
 


Once the service is created check out the env variables inside pods
    
    kubectl exec kubiapod env
 
From  inside the container. You can use the curl command to access the kubia service in any of the following ways:
    
    kubectl exec -it kubiapod bash
    root@kubia-3inly:/# curl http://kubia.default.svc.cluster.local
    root@kubia-3inly:/# curl http://kubia.default
    root@kubia-3inly:/# curl http://kubia

 - Here kubia corresponds to the service name, default stands for the namespace the service is defined in,
 - svc.cluster.local is a configurable cluster domain suffix used in all cluster local service names. 
 - All of this possible because of DNS service running. 

## nodeport service 

    kubectl apply -f kubia-svc-nodeport.yaml
    kubectl get svc 
    
 - Open the web-browser and enter Public-IP of Master OR worker node followed by :NodePort
 - public-ip-of-master-or-worker-node:nodeport 

## You want to investigate further in the IPTables for service 

    kubectl get svc
    iptables-save |grep -i 10.99.249.130   ## cluster IP of the service
    iptables-save |grep -i KUBE-SVC-OGYXBJX3CJ7W6DXK   ## From the result of above command you will find KUBE-SVC-*****
    iptables-save |grep -i KUBE-SEP-YWMUSWLZWZGIUDKB   ## From the result of above command you will find KUBE****
    kubectl get pods -o wide                           ## Search the IP address of the pods in the output of iptables-save


## ingress service 

- Follow the link  -    https://github.com/ashishrpandey/kubernetes-training/blob/master/ingress.md


- How to use aws ALB as ingress 
https://aws.amazon.com/blogs/opensource/kubernetes-ingress-aws-alb-ingress-controller/

- More about the flow of data packets in Kubernetes
https://sookocheff.com/post/kubernetes/understanding-kubernetes-networking-model/
