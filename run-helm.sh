
[[ $2 = "" ]] && helm install $1 ./roboshop-helm -f dev-values/$1.yaml  && exit 0
[[ $2 = "-d" ]] && helm upgrade -i $1 ./roboshop-helm -f dev-values/$1.yaml --dry-run && exit 0

