#!/usr/bin/env bash
set -e

PROJECT=pg-cham-test

echo "Creating project: $PROJECT"
mkdir -p $PROJECT/pgchameleon
cd $PROJECT

echo "Writing docker-compose.yml"
cat > docker-compose.yml <<'EOF'
#version: "3.9"

services:

  mysql:
    image: mariadb:10.11
    #container_name: mysql
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: testdb
      MYSQL_USER: testuser
      MYSQL_PASSWORD: testpass
    command:
      - --log-bin=mysql-bin
      - --binlog-format=ROW
      - --server-id=1
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-prootpass"]
      interval: 10s
      retries: 10

  postgres:
    image: postgres:15
    #container_name: postgres
    restart: unless-stopped
    environment:
      POSTGRES_PASSWORD: pgpass
      POSTGRES_DB: testdb
    ports:
      - "5432:5432"
    volumes:
      - pg-data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      retries: 10

  pgchameleon:
    image: the4thdoctor/pgchameleon:latest
    #container_name: pgchameleon
    depends_on:
      mysql:
        condition: service_healthy
      postgres:
        condition: service_healthy
    volumes:
      - ./pgchameleon/config.yml:/etc/pgchameleon/config.yml
      - ./sysdata/pgchamtest-data:/var/lib/pgchameleon
    command: >
      bash -c "
      chameleon setconf replica1 &&
      chameleon create_replica replica1 &&
      chameleon start_replica replica1 &&
      tail -f /var/lib/pgchameleon/logs/*.log
      "

volumes:
  mysql-data:
  pg-data:
  pgcham-data:
EOF

echo "Writing pgchameleon/config.yml"
cat > pgchameleon/config.yml <<'EOF'
source:
  type: mysql
  db_conn:
    host: mysql
    port: 3306
    user: testuser
    passwd: testpass
    charset: utf8mb4

target:
  db_conn:
    host: postgres
    port: 5432
    user: postgres
    passwd: pgpass
    database: testdb

replica:
  batch_size: 10000
  skip_tables: []
  skip_schemas: []
  limit_tables: []
  limit_schemas: []
EOF

echo "Done."
echo
echo "Next steps:"
echo "  cd $PROJECT"
echo "  docker compose up -d"
echo "  docker logs -f pgchameleon"
