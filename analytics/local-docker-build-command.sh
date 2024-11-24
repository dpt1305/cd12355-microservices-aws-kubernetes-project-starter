# Docker build image
docker build -t test-coworking-analytics .


# Docker run container
docker run -d -e DB_HOST=127.0.0.1 \
    -e DB_USERNAME=myuser \
    -e DB_PASSWORD=mypassword \
    -e DB_PORT=5433 \
    -e DB_NAME=uda-db \
    --network="host" \
    test-coworking-analytics;
    