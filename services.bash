## 
kubectl create -f kubia-svc.yaml

 kubectl get svc
 NAME         CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
kubernetes   10.111.240.1     <none>        443/TCP   30d
kubia        10.111.249.153   <none>        80/TCP    6m    

## replace with your pod name and ip
 kubectl exec kubia-7nog1 -- curl -s http://10.111.249.153
 
## once the service is created check outt the env variables inside pods
 kubectl exec kubia-3inly env
 
 ## Cluster IP
 kubectl exec -it kubia-3inly bash

 ## From  inside the container. You can use the curl command to access the kubia service in any of the following ways:
root@kubia-3inly:/# curl http://kubia.default.svc.cluster.local
root@kubia-3inly:/# curl http://kubia.default
root@kubia-3inly:/# curl http://kubia