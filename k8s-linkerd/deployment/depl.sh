linkerd inject deployment.yml | kubectl apply -f -
while [[ $(kubectl get pods -l app=hello -n test -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != *"True" ]]; do echo "waiting for pod" && sleep 1; done
while [[ $(kubectl get pods -l app=world -n test -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != *"True" ]]; do echo "waiting for pod" && sleep 1; done
while [[ $(kubectl get pods -l app=world2 -n test -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != *"True" ]]; do echo "waiting for pod" && sleep 1; done
kubectl --namespace test port-forward svc/hello 30000
