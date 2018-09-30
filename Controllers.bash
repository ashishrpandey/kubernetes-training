## to make the app fail artificially.
## and properly demo liveness probes, we modified app slightly and made it return a 500 Internal Server Error 
## HTTP status code for each request after the fifth one—your app will handle the first five client requests properly and then return an error on every subsequent request. Thanks to the liveness probe, 
## it should be restarted when that happens, allowing it to properly handle client requests again.

 #refer to kubia-liveness-probe.yaml
 
 # launch pod 
  kubectl create -f kubia-manual.yaml

kubectl get po kubia-liveness

# after it gets restarted
 kubectl logs mypod --previous
 
# get pod info=> check liveness field
 kubectl describe po kubia-liveness
 
 ## Follow below commnads and observe how pods are getting created 
  kubectl create -f kubia-rc.yaml
  kubectl get pods
  kubectl delete pod kubia-53thy
  kubectl get pods
  kubectl get rc
 
 ## Observe RC
  kubectl describe rc kubia
  
  ## Modify a pod's label 
  kubectl get pods --show-labels
   kubectl label pod <podname> app=foo --overwrite
# observe the pods with label column [new pod being created]
  kubectl get pods -L app
  
  ## Scale out
   kubectl scale rc kubia --replicas=10
   
   ## Delete without eleting pods 
   kubectl delete rc kubia --cascade=false
   
   
   
 ## Replica Set
 # creation 
 kubectl create -f kubia-replicaset.yaml
 
 kubectl get rs 
 kubectl describe rs
 
 ## Daemon set
 
 ## This daemon set is designed to run on all the disks that has ssd disk (disk=ssd )
  kubectl create -f ssd-monitor-daemonset.yaml
  kubectl get ds
  kubectl get po
  kubectl get node
  kubectl label node <nodename> disk=ssd
  # check it now 
  kubectl get po
  
  
 ## job
 kubectl get jobs
 kubectl get po

## After the two minutes have passed, see the status "completed"
 kubectl get po -a
 kubectl logs <jobpodname>

## Sequential comletion and parallelism

kubectl create -f multi-completion-batch-job.yaml
kubectl create -f multi-completion-parallel-batch-job.yaml
## You can even change a Job’s parallelism property while the Job is running
kubectl scale job multi-completion-batch-job --replicas 3
