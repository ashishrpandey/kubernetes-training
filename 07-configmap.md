### config map 
You can define the map’s entries by passing literals to the kubectl command or you
can create the ConfigMap from files stored on your disk. Use a simple literal first:

    $ kubectl create configmap fortune-config --from-literal=sleep-interval=25
    configmap "fortune-config" created

To create a ConfigMap with multiple
literal entries, you add multiple --from-literal arguments:
  
    $ kubectl create configmap myconfigmap --from-literal=foo=bar --from-literal=bar=baz --from-literal=one=two
 
 Lets look at the configmap just created 
    
    $ kubectl get configmap fortune-config -o yaml
    
We could have written a similar yml file to start with

    $ kubectl create -f fortune-config.yaml
    
CREATING A CONFIGMAP ENTRY FROM THE CONTENTS OF A FILE

    $ kubectl create configmap my-config --from-file=config-file.conf
    
Instead of importing each file individually, you can even import all files from a file
directory:

    $ kubectl create configmap my-config --from-file=/path/to/dir
    
