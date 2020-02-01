# k8s-serviceMesh
Base for master thesis which implements a basiv k8s cluster and installs different service meshes onto it. 


Will setup KinD Cluster with 5 Nodes. 

4 cases: 
* plain k8s with prometheus-operator 
* k8s + istio
* k8s + linkerd
* k8s + maesh

Each of them will be stress tested with jmeter and the response times will be monitored. 

