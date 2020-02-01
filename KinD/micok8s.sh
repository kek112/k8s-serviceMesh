#snapd have to be installed
curl -Lo ./kind "https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-$(uname)-amd64"
chmod +x ./kind

echo specify directory in PATH
read pathDir

mv ./kind /pathDir/kind

kind create cluster --name=kind --config=kind.yml


kind create cluster
sudo snap install microk8s --classic
microk8s.enable dashboard dns
microk8s.kubectl get all --all-namespaces
token=$(microk8s.kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s.kubectl -n kube-system describe secret $token
microk8s.kubectl cluster-info
microk8s.config