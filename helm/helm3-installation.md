## Download Helm 3

  	curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3

## Install Helm

    PATH=$PATH:/usr/local/bin
    chmod 700 get_helm.sh

    ./get_helm.sh
    


## Add the official chart repository

	helm repo add stable https://charts.helm.sh/stable
 
## Install mysql chart

	  helm search repo mysql
	  helm repo update
	  helm install stable/mysql --generate-name

  
## Behind the scenes 

	  cd .cache/helm/
	  tar -zxvf mysql-1.6.2.tgz
	  cd mysql/
	  vim Chart.yaml
	  vim values.yaml


- To dig deeper in Helm syntax please refer 
	
	- https://helm.sh/docs/chart_template_guide/variables/

## Create a chart

	$ helm create mychart
	Creating mychart
	
If you take a look at the mychart/templates/ directory, you'll notice a few files already there.

- NOTES.txt: The "help text" for your chart. This will be displayed to your users when they run helm install.
- deployment.yaml: A basic manifest for creating a Kubernetes deployment
- service.yaml: A basic manifest for creating a service endpoint for your deployment
- _helpers.tpl: A place to put template helpers that you can re-use throughout the chart

try: 

	helm install --debug --dry-run <name-of-release>
	
	
