- bajar del repositorio de git los archivos de terraform
	https://github.com/MartinCalderon18/pin2021
- Modificar el archivo eks-cluster y agregar 
	  version         = "17.24.0"
- Ejecutar los siguientes comandos de terraform
		terraform init (validar que este ok)
		terraform validate 
		terraform plan (validar que este ok)
		terraform apply (esperar que se cree todo)
- conectar al cluster con el siguiente comando
	aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
- Se creo la cuenta de servicio con el siguiente comando
	Kubectl apply -f ado-admin-service-account.yaml
- Se ejecuto el archivo con el siguiente comando 
		kubectl apply o create -f nginx-deployment.yaml
- Se ejecuto el comando para validar los servicios
		kubectl get services
- Se siguieron los pasos de la siguiente guia.
	https://grafana.com/docs/grafana-cloud/kubernetes/prometheus/prometheus_operator/
- Se creo la cuenta de grafana cloud y se obtuvo la API-KEY