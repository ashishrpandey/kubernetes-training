## Download Helm 3

  	curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3

## Install Helm

    chmod 700 get_helm.sh

    ./get_helm.sh


## Add the official chart repository

	helm repo add stable https://kubernetes-charts.storage.googleapis.com/
 
## Install mysql chart

	  helm search repo stable
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
