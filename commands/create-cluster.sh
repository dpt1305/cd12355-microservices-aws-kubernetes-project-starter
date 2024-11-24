# check account aws 
aws sts get-caller-identity

# create cluster
eksctl create cluster --name uda-cluster \
    --region us-east-1 \
    --nodegroup-name my-nodes \
    --node-type t3.small \
    --nodes 1 --nodes-min 1 --nodes-max 2;

# update config to local kube
aws eks --region us-east-1 update-kubeconfig --name uda-cluster;

# get all context
kubectl config get-contexts;

# delete context
kubectl config delete-context NAME;

# delete eks cluster
eksctl delete cluster --name uda-cluster --region us-east-1;

# get namespace
kubectl get namespace;