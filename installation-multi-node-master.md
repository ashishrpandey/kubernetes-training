
Master 1 
Master 2 
Master 3 
Worker  3.1.222.173


https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/

Stacked control plane and etcd nodes

yum install nc -y 


sudo kubeadm init --control-plane-endpoint "myELB-1453631285.ap-southeast-1.elb.amazonaws.com:80" --pod-network-cidr=192.168.0.0/16  --ignore-preflight-errors=NumCPU --upload-certs


Other Blog posts: 

Setup HA Proxy first

https://blogs.vmware.com/cloudnative/2019/05/22/kube-apiserver-load-balancers-on-premises-kubernetes-clusters/

https://blog.heptio.com/kubernetes-ha-under-x-ray-5d05f552c9f




