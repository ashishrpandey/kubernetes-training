

For Amazon Linux 2 systems
Launch 2 amazon linux 2 machines
1 master and 1 slaves

On both master and slave nodes :

    sudo su 
    yum install docker -y 
    systemctl enable docker && systemctl start docker



    cat <<EOF > /etc/yum.repos.d/kubernetes.repo
    [kubernetes]
    name=Kubernetes
    baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
    enabled=1
    gpgcheck=1
    repo_gpgcheck=0
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    exclude=kube*
    EOF

    cat <<EOF >  /etc/sysctl.d/k8s.conf
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1
    EOF
    sysctl --system

    setenforce 0 . #disable secure linux. not recomended for production

### install kubelet, kubeadm and kubectl; start kubelet daemon
### Do it on both master as welll as worker nodes 

    yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

    systemctl enable kubelet && systemctl start kubelet

### On master node  initialize the cluster 

    sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=NumCPU
    #  sudo kubeadm init --pod-network-cidr=192.168.0.0/16 #Do this only if proper CPU cores are available
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    export KUBECONFIG=/etc/kubernetes/kubelet.conf

## On Worker nodes, Switch to the root mode
Copy kubeadm join command from output of "kubeadm init on master node" 
   
    <kubeadm join command copies from master node>


## For calico networking: apply on master node only

    sudo kubectl apply -f https://docs.projectcalico.org/v3.2/getting-started/kubernetes/installation/hosted/etcd.yaml
    sudo kubectl apply -f https://docs.projectcalico.org/v3.2/getting-started/kubernetes/installation/rbac.yaml
    sudo kubectl apply -f https://docs.projectcalico.org/v3.2/getting-started/kubernetes/installation/hosted/calico.yaml
    

Take a pause of 2 minutes and see if the nodes are ready; run it on master node

    kubectl get nodes

watch system pods

    kubectl get pods --all-namespaces


on all the worker nodes do below to make kubectl command work on worker

    mkdir -p $HOME/.kube
    export KUBECONFIG=/etc/kubernetes/kubelet.conf
    
to run a service, run following command on master

    kubectl run  nginx --image=nginx --port=80  --> if you get forbidden error then exit and do "sudo su -"
    kubectl  get pods -o wide . --> to see where pod got created
