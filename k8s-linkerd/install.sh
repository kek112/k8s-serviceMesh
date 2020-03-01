kind create cluster --name=kind --config=../KinD/kind.yml
linkerd install | kubectl apply -f -
kubectl wait --for=condition=Ready pods --all -n linkerd --timeout=500s
