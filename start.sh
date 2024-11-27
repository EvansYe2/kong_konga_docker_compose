#!/bin/bash

echo "Starting kong-database..."

docker-compose up -d kong-database

STATUS="starting"

#while [ "$STATUS" != "healthy" ]
#do
#    STATUS=$(docker inspect --format {{.State.Health.Status}} kong-database)
#    echo "kong-database state = $STATUS"
#    sleep 5
#done

sleep 5

echo "Run database kong-migration..."

docker-compose up kong-migration

echo "Starting kong..."

docker-compose up -d kong

echo "Kong admin running http://127.0.0.1:8001/"
echo "Kong proxy running http://127.0.0.1/"

echo "Starting konga..."

docker-compose up konga-prepare


echo "Starting konga..."

docker-compose up -d konga

echo "Konga running http://127.0.0.1:1337/"

