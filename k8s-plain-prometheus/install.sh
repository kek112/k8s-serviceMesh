kind create cluster --name=kind --config=../KinD/kind.yml
kubectl create -f kube-prometheus-master/manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f kube-prometheus-master/manifests/
kubectl wait --for=condition=Ready pods --all -n monitoring --timeout=500s
cd deployment
./depl.sh