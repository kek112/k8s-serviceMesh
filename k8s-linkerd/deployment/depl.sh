linkerd inject deployment.yml | kubectl apply -f -
kubectl wait --for=condition=Ready pods --all -n test
kubectl --namespace test port-forward svc/hello 30000
