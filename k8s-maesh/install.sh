kubectl create namespace maesh
helm install maesh maesh-master/helm/chart/maesh --namespace maesh --set controller.image.pullPolicy=IfNotPresent --set controller.image.tag=latest
kubectl wait --for=condition=Ready pods --all -n maesh --timeout=500s
#cd deployment
#./depl.sh

#kubectl --namespace maesh port-forward svc/grafana 3000