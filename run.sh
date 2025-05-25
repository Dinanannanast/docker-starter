#!/bin/bash

# Docker Compose Services Runner
# This script provides commands to manage Docker Compose services

# Display help message
show_help() {
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  up        Start all services in detached mode"
    echo "  down      Stop all services"
    echo "  down-v    Stop all services and remove volumes"
    echo "  logs      View logs from all services"
    echo "  logs SERVICE_NAME  View logs for a specific service"
    echo "            (postgres, zookeeper, kafka, kafkaui)"
    echo "  help      Display this help message"
    echo ""
    echo "Examples:"
    echo "  $0 up"
    echo "  $0 logs kafka"
}

# Check if Docker Compose is installed
check_docker_compose() {
    if ! command -v docker-compose &> /dev/null; then
        echo "Error: docker-compose is not installed or not in PATH"
        exit 1
    fi
}

# Main script logic
main() {
    check_docker_compose

    case "$1" in
        up)
            echo "Starting all services in detached mode..."
            docker-compose up -d
            echo "Services started. Access Kafka UI at http://localhost:8282 or http://localhost:8181"
            ;;
        down)
            echo "Stopping all services..."
            docker-compose down
            ;;
        down-v)
            echo "Stopping all services and removing volumes..."
            docker-compose down -v
            ;;
        logs)
            if [ -z "$2" ]; then
                echo "Viewing logs for all services (press Ctrl+C to exit)..."
                docker-compose logs -f
            else
                echo "Viewing logs for $2 (press Ctrl+C to exit)..."
                docker-compose logs -f "$2"
            fi
            ;;
        help|"")
            show_help
            ;;
        *)
            echo "Unknown command: $1"
            show_help
            exit 1
            ;;
    esac
}

# Execute main function with all arguments
main "$@"
