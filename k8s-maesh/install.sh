kubectl create namespace maesh
helm install --namespace=maesh maesh maesh/maesh

kubectl wait --for=condition=Ready pods --all -n maesh --timeout=500s
cd deployment
./depl.sh


