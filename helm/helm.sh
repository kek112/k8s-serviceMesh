sudo snap install helm --classic

helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update

kubectl create namespace monitoring
