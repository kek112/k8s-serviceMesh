kubectl create ns monitoring
helm install metrics -n monitoring stable/prometheus-operator --set alertmanager.enabled=false
kubectl wait --for=condition=Ready pods --all -n monitoring --timeout=500s

# install LoadBalancer, Ingress Controller and deployment
cd deployment || exit
./depl.sh
cd ../../metalLB/ || exit
./install.sh
cd ../traefik || exit
./install.sh
