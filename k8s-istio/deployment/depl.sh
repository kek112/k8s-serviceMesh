istioctl kube-inject -f deployment.yml | kubectl apply -f -
kubectl --namespace test port-forward svc/hello 30000
