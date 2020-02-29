kind create cluster --name=kind --config=../KinD/kind.yml
kubectl create namespace maesh
helm install maesh maesh-master/helm/chart/maesh --namespace maesh --set controller.image.pullPolicy=IfNotPresent --set controller.image.tag=v1.1.0-rc1-amd64

#kubectl --namespace maesh port-forward svc/grafana 3000