#snapd have to be installed
curl -Lo ./kind "https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-$(uname)-amd64"
chmod +x ./kind

echo specify directory in PATH
read pathDir

mv ./kind /pathDir/kind

kind create cluster --name=kind --config=kind.yml

kind delete cluster --name=kind
kind create cluster

# Dashboard prometheus
# kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090
# Grafana
# kubectl --namespace monitoring port-forward svc/grafana 3000
# kubectl --namespace test port-forward svc/hello 30000

./apache-jmeter-5.2.1/bin/jmeter -n -t 'Thread Group.jmx' -l 5PodK8s.txt

./apache-jmeter-5.2.1/bin/jmeter -g <log file> -o <Path to output folder>

kubectl autoscale deployment hello --cpu-percent=50 --min=1 --max=10 -n test
kubectl autoscale deployment world --cpu-percent=50 --min=1 --max=10 -n test
kubectl autoscale deployment world2 --cpu-percent=50 --min=1 --max=10 -n test
 kubectl run --generator=run-pod/v1 -it --rm load-generator --image=busybox /bin/sh
 while true; do wget -q -O- http://hello.test.svc.cluster.local:30000; done