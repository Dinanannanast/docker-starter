#!/bin/bash

set -e

echo "Waiting for Kafka to be ready..."
cub kafka-ready -b kafka:19092 1 30

echo "Creating topics..."
topics=(
  "status.rejected.out:6:1"
  "status.registered.out:6:1"
)

for topic in "${topics[@]}"; do
  IFS=':' read -r name partitions replication <<< "$topic"
  
  kafka-topics \
    --bootstrap-server kafka:19092 \
    --create \
    --if-not-exists \
    --topic "$name" \
    --partitions "$partitions" \
    --replication-factor "$replication"
    
  echo "Created topic $name"
done

echo "All topics created successfully"
