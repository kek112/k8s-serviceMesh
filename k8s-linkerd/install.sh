linkerd install | kubectl apply -f -
kubectl wait --for=condition=Ready pods --all -n linkerd --timeout=500s
cd deployment
./depl.sh
