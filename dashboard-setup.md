

https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

cd dashboard/

Launch the required  deployment, service sa, etc using - 

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml

kubectl apply -f dashboard-sa.yml 
 
kubectl apply -f dashboard-role-binding.yaml

kubectl proxy &

Open Firefox browser (It does not work in chrome due to security check )

<public-ip-of-master-node>:<nodeport>
  eg.
 52.66.246.227:30427/
 
 - Proceed by accepting the warning 
 
 it will ask for a token 
 
 Generate the token using below command on Master : 
 

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

Copy the roken from the output.
Paste it on the browser window under token field


