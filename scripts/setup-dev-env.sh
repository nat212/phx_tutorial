#!/usr/bin/env bash

if [[ ! -f .env ]]; then
  echo "Creating .env file"
  touch .env
  {
    echo "POSTGRES_USER=postgres"
    echo "POSTGRES_PASSWORD='$(date +%s | sha256sum | base64 | head -c 15)'"
    echo "POSTGRES_DB=phx_tutorial_dev"
    echo "SECRET_KEY_BASE='$(mix phx.gen.secret)'"
  } >.env
  echo "Stopping docker compose stack if already running"
  docker compose down --volumes
fi

export COMPOSE_FILE=docker-compose.local.yml

echo "Running docker compose stack"
docker compose up --wait
