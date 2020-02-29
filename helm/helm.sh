sudo snap install helm --classic

helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update

kubectl create namespace monitoring

kubectl create -f manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f manifests/

# kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090
# http://localhost:9090

#Grafana
# kubectl --namespace monitoring port-forward svc/grafana 3000