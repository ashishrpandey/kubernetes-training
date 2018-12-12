## A pod with two containers sharing the same volume
Described in fortune-pod.yml

## Launch the pod

    kubectl apply -f fortune-pod.yaml

    kubectl port-forward fortune 8080:80 &

    curl 127.0.0.1:8080

