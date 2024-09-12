kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

sleep 20
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

sleep 30
kubectl get secrets argocd-initial-admin-secret -o=jsonpath='{.data.password}' -n argocd  | base64 -d ; echo ""
