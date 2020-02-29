kind create cluster --name=kind --config=../KinD/kind.yml
istioctl manifest apply --set profile=demo
kubectl get pod -n istio-system

#  istioctl kube-inject -f deployment/deployment.yml | kubectl apply -f -
#  istioctl dashboard kiali
#  istioctl dashboard prometheus
#  istioctl dashboard jaeger
# istioctl dashboard grafana

#kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000 &

