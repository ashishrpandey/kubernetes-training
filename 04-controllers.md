### There are multiple types of Controllers in Kubernetes

# Replication Controller

## Follow below commnads and observe how pods are getting created 
    kubectl apply -f kubia-rc.yaml
    kubectl get pods
    kubectl delete pod kubia-53thy
    kubectl get pods
    kubectl get rc
 
 ### Observe RC
    kubectl describe rc kubia
  
 ### Modify a pod's label 
     kubectl get pods --show-labels
     kubectl label pod <podname> app=foo --overwrite

### observe the pods with label column [new pod being created]
    kubectl get pods -L app
  
### Scale out
    kubectl scale rc kubia --replicas=3

### Delete without deleting pods 
    kubectl delete rc kubia --cascade=false
   
  # Replica set
   
 ### Replica Set creation 
    kubectl create -f kubia-replicaset.yaml

    kubectl get rs 
    kubectl describe rs
 
# Daemon set
 
 ### This daemon set is designed to run on all the disks that has ssd disk (disk=ssd )
      kubectl create -f ssd-monitor-daemonset.yaml
      kubectl get ds
      kubectl get po
      kubectl get node
      kubectl label node <nodename> disk=ssd
 
 ### check it now 
     kubectl get po
  
# job
      kubectl get jobs
      kubectl get po

### After the two minutes have passed, see the status "completed"
     kubectl get po -a
     kubectl logs <jobpodname>

### Sequential completion and parallelism

    kubectl create -f multi-completion-batch-job.yaml
    kubectl create -f multi-completion-parallel-batch-job.yaml
### You can even change a Job’s parallelism property while the Job is running
    kubectl scale job multi-completion-batch-job --replicas 3
