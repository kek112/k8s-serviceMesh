kubectl apply -f deployment.yml
kubectl --namespace test port-forward svc/hello 30000
