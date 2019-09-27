
For reference - 
https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

cd dashboard/

Launch the required  deployment, service sa, etc using - 

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta1/aio/deploy/recommended.yaml

    kubectl apply -f dashboard-sa.yml 

    kubectl apply -f dashboard-role-binding.yaml

    kubectl proxy &

Edit the kubernetes-dashboard service type from ClusterIp to NodePort 

            kubectl edit svc kubernetes-dashboard
            <Change type: ClusterIp to type: NodePort>
            save the file and exit 
Observe the Node Port assigned to kubernetes-dashboard service

Open Firefox browser (It does not work in chrome due to security check )

     https://<public-ip-of-master-node>:<nodeport>
      eg.
     https://52.66.246.227:30427/
 
 - Proceed by accepting the warning 
 
 - It will ask for a token 

 - Generate the token using below command on Master: 
 

    kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

Copy the token from the output.
Paste it on the browser window under token field
