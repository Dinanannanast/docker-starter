# Docker Starter

A ready-to-use Docker Compose configuration for local development with PostgreSQL, Zookeeper, Kafka, Kafka UI, WireMock, and Nexus.

## Services Included

- **PostgreSQL**: A powerful, open-source object-relational database system
- **Zookeeper**: A centralized service for maintaining configuration information and distributed synchronization
- **Kafka**: A distributed event streaming platform
- **Kafka UI (Kafdrop)**: A web UI for viewing Kafka topics and browsing consumer groups
- **Kafka UI (Provectus)**: An alternative web UI for Apache Kafka
- **WireMock**: A simulator for HTTP-based APIs
- **Nexus**: A repository manager for storing and distributing artifacts

## Configuration Details

### PostgreSQL
- **Port**: 5432
- **Username**: postgres
- **Password**: postgres
- **Default Database**: mydb
- **Data Volume**: Persistent storage for database files

### Zookeeper
- **Port**: 2181
- **Data Volumes**: Persistent storage for data and logs

### Kafka
- **Ports**: 
  - 9092 (external access)
  - 29092 (internal container access)
- **Data Volume**: Persistent storage for Kafka data

### Kafka UI (Kafdrop)
- **Port**: 8282 (mapped from container port 9000)
- **URL**: http://localhost:8282

### Kafka UI (Provectus)
- **Port**: 8181 (mapped from container port 8080)
- **URL**: http://localhost:8181

### WireMock
- **Port**: 8585 (mapped from container port 8080)
- **URL**: http://localhost:8585

### Nexus
- **Port**: 8686 (mapped from container port 8081)
- **URL**: http://localhost:8686

## Usage

### Using the Helper Script

A helper script `run.sh` is provided to simplify managing the Docker Compose services:

```bash
# Make the script executable (first time only)
chmod +x run.sh

# Start all services
./run.sh up

# Stop all services
./run.sh down

# Stop all services and remove volumes
./run.sh down-v

# View logs for all services
./run.sh logs

# View logs for a specific service
./run.sh logs [service_name]

# Show help
./run.sh help
```

### Manual Docker Compose Commands

You can also use Docker Compose commands directly:

#### Starting the Services

```bash
docker-compose up -d
```

This command starts all services in detached mode.

#### Stopping the Services

```bash
docker-compose down
```

To remove all data volumes when stopping:

```bash
docker-compose down -v
```

#### Viewing Logs

```bash
docker-compose logs -f [service_name]
```

Replace `[service_name]` with one of: postgres, zookeeper, kafka, kafkaui, or omit for all services.

## Accessing Services

- **PostgreSQL**: Connect to `localhost:5432` with username `postgres` and password `postgres`
- **Kafka**: Connect to `localhost:9092` for producers and consumers
- **Kafka UI (Kafdrop)**: Open http://localhost:8282 in your web browser
- **Kafka UI (Provectus)**: Open http://localhost:8181 in your web browser
- **WireMock**: Access the API at http://localhost:8585
- **Nexus**: Open http://localhost:8686 in your web browser (default credentials: admin/admin123)

## Configuration Files

This repository includes configuration files for each service in the `volumes` directory:

### PostgreSQL
- `volumes/postgres/conf/postgresql.conf`: PostgreSQL main configuration file
- `volumes/postgres/conf/pg_hba.conf`: PostgreSQL client authentication configuration file
- `volumes/postgres/init-db.sh`: Database initialization script
- `volumes/postgres/sql/dictionary_public.sql`: SQL script for database setup

### Zookeeper
- `volumes/zookeeper/conf/zoo.cfg`: Zookeeper configuration file

### Kafka
- `volumes/kafka/conf/server.properties`: Kafka broker configuration file
- `volumes/kafka/scripts/create-topics.sh`: Script to create Kafka topics

### Kafka UI (Provectus)
- `volumes/kafka-ui/dynamic_config.yaml`: Configuration for Provectus Kafka UI

### WireMock
- `volumes/wiremock/stubs`: Directory for WireMock stub mappings

These files are already mounted as volumes in the `docker-compose.yml` file. To customize them:

1. Modify the configuration files according to your needs
2. Restart the services with `./run.sh down && ./run.sh up`
