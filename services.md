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

 -- here kubia corresponds to the service name, default stands for the namespace the service is defined in, and svc.cluster.local is a configurable cluster domain suffix used in all cluster local service names. All of this possible because of DNS service running. 

## nodeport service 


## ingress service 

    It would not work as w need a real ingress 
 
    kubia-ingress.yaml
    vim kubernetes-training/05\ Services/kubia-ingress.yaml
     kubectl apply -f  kubernetes-training/05\ Services/kubia-svc-nodeport.yaml
      kubectl get ingresses
      NAME      HOSTS               ADDRESS          PORTS     AGE
     kubia     kubia.example.com   192.168.99.100   80        29m

      kubectl describe ingresses kubia


how to use aws ALB as ingress 
https://aws.amazon.com/blogs/opensource/kubernetes-ingress-aws-alb-ingress-controller/

 
