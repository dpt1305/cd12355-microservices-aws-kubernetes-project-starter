# check account aws 
aws sts get-caller-identity

# create cluster
eksctl create cluster --name uda-cluster \
    --region us-east-1 \
    --nodegroup-name my-nodes \
    --node-type t3.small \
    --nodes 1 --nodes-min 1 --nodes-max 2;

# add Add-on
# aws iam attach-role-policy \
# --role-name my-worker-node-role \
# --policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy;
aws eks create-addon \
    --addon-name amazon-cloudwatch-observability \
    --cluster-name uda-cluster \
    --region us-east-1;

# update config to local kube
aws eks --region us-east-1 update-kubeconfig --name uda-cluster;

# view all config of kubectl
kubectl config view
