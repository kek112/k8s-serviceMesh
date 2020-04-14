linkerd inject deployment.yml | kubectl apply -f -
kubectl wait --for=condition=Ready pods --all -n test --timeout=500s