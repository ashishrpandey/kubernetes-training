# How to associate a static ip to a container

## Before starting 
Open /etc/default/docker and add the below entry:

    DOCKER_OPTS="--bridge=br0 --ip-masq=false --iptables=false". 
(Assuming that br0 bridge is already configured.)

### Add the below format to your /etc/network/interface -
    auto lo
    iface lo inet loopback

    auto eth0
    iface eth0 inet static
        pre-up ip addr flush dev eth0
        address 192.168.0.249
        netmask 255.255.255.0
        gateway 192.168.0.1

Note that container should be started with
          
          --cap-add=NET_ADMIN --net=bridge. 

Also, container's entry script should begin with 
        
            /etc/init.d/networking start

Also entry script needs to edit or populate /etc/hosts file in order to remove references to Docker-assigned IP.
