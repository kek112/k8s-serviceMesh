kind create cluster --name=kind --config=../KinD/kind.yml
linkerd install | kubectl apply -f -
kubectl -n linkerd get deploy