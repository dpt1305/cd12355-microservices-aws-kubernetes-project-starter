# move to folder
cd ../deployment-local;

# Kubec apply deployments and services
kubectl apply -f pvc.yaml;
kubectl apply -f pv.yaml;
kubectl apply -f postgresql-deployment.yaml;
kubectl apply -f postgresql-service.yaml;

# Set up port-forwarding to `postgresql-service`
kubectl port-forward service/postgresql-service 5433:5432 &;

# Insert values to database
export DB_PASSWORD=mypassword;
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d uda-db -p 5433 < ../db/1_create_tables.sql;
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d uda-db -p 5433 < ../db/2_seed_users.sql;
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d uda-db -p 5433 < ../db/3_seed_tokens.sql;

# Close port-forwarding
ps aux | grep 'kubectl port-forward' | grep -v grep | awk '{print $2}' | xargs -r kill
