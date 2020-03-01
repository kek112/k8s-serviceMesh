#Kubernetes and Service Meshes

This little Project helps to setup an local Kubernetes cluster with KinD. 
It will start 5 nodes with one of them as the Master (No HA Configuration).
All of this was created in the process of my master thesis and served the purpose to check how much 
performance are used by the different Service Meshes. For this i created an example application which 
consist of 
* HTTP Echo 
* Service
* Namespace
* HPA 
These parts are applied three times onto the kubernetes Cluster to check how i can deploy them also in the Service Meshes.
In this process i had to apply them each with an fixed amount of replicas. 
The original planned deployment is defined in the [deployment.yml](./deployment.yml). 

###Prerequisites
You need: 
* working KinD 
* kubectl 
* istioctl 
* linkerd
* helm 
* jmeter 
* some basic k8s knowledge

## Kubernetes + Prometheus Operator
As reference the first Installation is the plain Kubernetes Cluster with Prometheus Operator. 
For this i created a [kind.yml](./KinD/kind.yml) which defines an 5 Nodes Cluster in KinD.
The Script [install.sh](./k8s-plain-prometheus/install.sh) provides the automatic prometheus/grfana 
installation.   

####Application
My example application is defined in the [deployment.yml](./k8s-plain-prometheus/deployment/deployment.yml)
To Install it just run the [install.sh](./k8s-plain-prometheus/deployment/depl.sh). It will deploy the 
previous defined application.
##Istio
##Linkerd
##Maesh

