## Playing with a service 

 Create a normal Service

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
