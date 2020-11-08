# Kubernetes and Service Meshes

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

### Prerequisites
You need: 
* working KinD 
* kubectl 
* istioctl 
* linkerd
* helm3 
* jmeter 
* some basic k8s knowledge

## Local Cluster 

To start a local K8s Cluster ou need KinD or some other On-Prem Virtualization. 
For this I created a [kind.yml](./KinD/kind.yml) which defines an 5 Nodes Cluster in KinD.
Just run the command: `kind create cluster --name=kind --config=./KinD/kind.yml` and youre ready to go. 

## Kubernetes + Prometheus Operator
As reference the first Installation is the plain Kubernetes Cluster with Prometheus Operator. 
The Script [install.sh](./k8s-plain-prometheus/install.sh) provides the automatic prometheus/grfana 
installation.   

#### Application
My example application is defined in the [deployment.yml](./k8s-plain-prometheus/deployment/deployment.yml)
To Install it just run the [install.sh](./k8s-plain-prometheus/install.sh). It will deploy the 
previous defined application. 
It will install: 
* metrics server (grafana/prometheus)
* MetalLB as a Load Balancer so the ingress controller will work locally
* treafik as an ingress controller

Side Note: if you're running this in a cloud environment you won't need metalLB, so just remove the line

###Steps
+ have KinD running with the [kind.yml](./KinD/kind.yml) as parameter (Or connect to an Cloud Kubernetes Cluster)
`kind create cluster --name=kind --config=KinD/kind.yml`
+ Start the installation of the environment through the install.sh of the folder 
+ after that you can start the application with the depl.sh 
+ modify the hosts file to access the correct ip address when testing see deployment.yaml (host: flask.app) and change the host to what you want
my hosts entry looks like this:  20.50.148.148 flask.app
