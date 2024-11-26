# move to folder
cd ../deployment;

# Kubec apply deployments and services
kubectl apply -f pvc.yaml;
kubectl apply -f pv.yaml;
kubectl apply -f postgresql-deployment.yaml;
kubectl apply -f postgresql-service.yaml;
kubectl apply -f  coworking.yaml
kubectl create -f  configmap.yaml

# Set up port-forwarding to `postgresql-service`
kubectl port-forward service/postgresql-service 5433:5432 &;

# Insert values to database
export DB_PASSWORD=mypassword;
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d uda-db -p 5433 < ../db/1_create_tables.sql;
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d uda-db -p 5433 < ../db/2_seed_users.sql;
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d uda-db -p 5433 < ../db/3_seed_tokens.sql;

# Close port-forwarding
ps aux | grep 'kubectl port-forward' | grep -v grep | awk '{print $2}' | xargs -r kill

# detele resources
kubectl delete -f postgresql-deployment.yaml;
kubectl delete -f postgresql-service.yaml;
kubectl delete -f  coworking.yaml;
kubectl delete -f  configmap.yaml
kubectl delete -f pvc.yaml;
kubectl delete -f pv.yaml;
