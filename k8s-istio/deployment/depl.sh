istioctl kube-inject -f deployment.yml | kubectl apply -f -
kubectl wait --for=condition=Ready pods --all -n test --timeout=500s
#kubectl --namespace test port-forward svc/hello 30000

