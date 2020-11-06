# ROLLING UPDATE WITH A REPLICATIONCONTROLLER

Cleanup existing pods and replicasets 

### create RC and svc
	kubectl apply -f kubia-rc-and-service-v1.yaml

## 
	kubectl get svc kubia

## repeat the below command to see various different result
	curl http://<clusterIP>:80

## now perform rolling update 
 	kubectl rolling-update kubia-v1 kubia-v2 --image=luksa/kubia:v2
 
	 kubectl describe rc kubia-v2
 
 # Using Deployment 
 
 	kubectl create -f kubia-deployment-and-service-v1.yaml --record
 
  	kubectl rollout status deployment kubia
  
## patching a deployment
  	kubectl patch deployment kubia -p '{"spec": {"minReadySeconds": 10}}'

## change image
  	kubectl set image deployment kubia nodejs=luksa/kubia:v2
  
  	kubectl set image deployment kubia nodejs=luksa/kubia:v3
  
## You can follow the progress of the rollout with kubectl rollout status:

	kubectl rollout status deployment kubia

 	kubectl rollout undo deployment kubia
 
 	kubectl rollout history deployment kubia

	kubectl rollout undo deployment kubia --to-revision=1
	kubectl rollout pause deployment kubia
	kubectl rollout resume deployment kubia
	
update deployment with readiness probe:

	$ kubectl apply -f kubia-deployment-v3-with-readinesscheck.yaml
	deployment "kubia" configured
