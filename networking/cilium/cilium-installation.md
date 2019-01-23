### cilium installation guide

Mount the BPF filesystem on all k8s worker nodes. 

    mount bpffs /sys/fs/bpf -t bpf

Download the DaemonSet template cilium.yaml and specify the etcd address (For kubernetes version 1.12):

    $ wget https://raw.githubusercontent.com/cilium/cilium/1.3.2/examples/kubernetes/1.12/cilium.yaml
    $ vim cilium.yaml
    [adjust the etcd address]
    
Deploy cilium with your local changes

    $ kubectl create -f ./cilium.yaml
    clusterrole "cilium" created
    serviceaccount "cilium" created
    clusterrolebinding "cilium" created
    configmap "cilium-config" created
    secret "cilium-etcd-secrets" created
    daemonset "cilium" created

    $ kubectl get ds --namespace kube-system
    NAME            DESIRED   CURRENT   READY     NODE-SELECTOR   AGE
    cilium          1         1         1         <none>          2m
