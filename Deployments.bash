## ROLLING UPDATE WITH A REPLICATIONCONTROLLER

## cleanup existing pods and replicasets 

# The app now also shows the version of it 
#create RC and svc
kubectl apply-f kubia-rc-and-service-v1.yaml

## 
kubectl get svc kubia

## repeat the below command to see various different result
curl http://<clusterIP>:80

## now perform rolling update 
 kubectl rolling-update kubia-v1 kubia-v2 --image=luksa/kubia:v2
 
 kubectl describe rc kubia-v2
 
 ## Do it more declaratively
 $ kubectl create -f kubia-deployment-v1.yaml --record
 
  kubectl rollout status deployment kubia
  
  ## patching a deployment
  $ kubectl patch deployment kubia -p '{"spec": {"minReadySeconds": 10}}'
 ## change image
  $ kubectl set image deployment kubia nodejs=luksa/kubia:v2
  
  kubectl set image deployment kubia nodejs=luksa/kubia:v3
  
  ## You can follow the progress of the rollout with kubectl rollout status:

$ kubectl rollout status deployment kubia

 $ kubectl rollout undo deployment kubia
 
 $ kubectl rollout history deployment kubia

	$ kubectl rollout undo deployment kubia --to-revision=1