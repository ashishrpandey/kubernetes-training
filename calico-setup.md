Launch calicoctl in a pod 

    kubectl apply -f https://docs.projectcalico.org/v3.5/getting-started/kubernetes/installation/hosted/calicoctl.yaml

Create an alias so that you can use calicotl utility from the host itself

    alias calicoctl="kubectl exec -i -n kube-system calicoctl /calicoctl -- "


Try the command below to see if it is working properly

      calicoctl get node
      
For more help run

      calicoctl --help 
      
