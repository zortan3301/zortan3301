docker-compose -f local-kafka.yaml -p kafka up -d
docker-compose -p kafka logs -f
# docker-compose -p kafka down