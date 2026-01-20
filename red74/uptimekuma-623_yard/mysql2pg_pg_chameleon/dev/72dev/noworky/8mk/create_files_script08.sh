#!/bin/bash

# Create pg_chameleon Docker setup
# This script creates all necessary files for the Docker environment

set -e

echo "Creating pg_chameleon Docker setup..."

# Create directory structure
mkdir -p config
mkdir -p mysql-init
mkdir -p postgres-init

# Create docker-compose.yml
cat > docker-compose.yml << 'EOF'
services:
  mysql:
    image: mysql:8.0
    container_name: chameleon_mysql
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: delphis_mediterranea
      MYSQL_USER: usr_replica
      MYSQL_PASSWORD: replica_pass
    ports:
      - "23306:3306"
    volumes:
      - mysql_data:/var/lib/mysql
      - ./mysql-init:/docker-entrypoint-initdb.d
    command: --binlog-format=ROW --server-id=100 --log-bin=mysql-bin --binlog-row-image=FULL
    networks:
      - chameleon_net

  postgres:
    image: postgres:15
    container_name: chameleon_postgres
    environment:
      POSTGRES_PASSWORD: postgres
      POSTGRES_USER: postgres
      POSTGRES_DB: sakila
    ports:
      - "25432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./postgres-init:/docker-entrypoint-initdb.d
    networks:
      - chameleon_net

  chameleon:
    build: .
    container_name: pg_chameleon
    depends_on:
      - mysql
      - postgres
    volumes:
      - ./config:/home/chameleon/.pg_chameleon/configuration
      - chameleon_logs:/var/log/pg_chameleon
    networks:
      - chameleon_net
    stdin_open: true
    tty: true
    command: tail -f /dev/null

volumes:
  mysql_data:
  postgres_data:
  chameleon_logs:

networks:
  chameleon_net:
    driver: bridge
EOF

# Create Dockerfile
cat > Dockerfile << 'EOF'
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -u 1000 -s /bin/bash chameleon

# Install pg_chameleon
RUN pip install --no-cache-dir pg_chameleon

# Create configuration directory with proper permissions
RUN mkdir -p /home/chameleon/.pg_chameleon/configuration && \
    chown -R chameleon:chameleon /home/chameleon/.pg_chameleon

# Create log directory with proper permissions
RUN mkdir -p /var/log/pg_chameleon && \
    chown -R chameleon:chameleon /var/log/pg_chameleon

# Switch to non-root user
USER chameleon

# Set working directory
WORKDIR /home/chameleon

# Default command
CMD ["bash"]
EOF

# Create postgres-init/01-create-users.sql
cat > postgres-init/01-create-users.sql << 'EOF'
-- Create replication user
CREATE USER usr_replica WITH PASSWORD 'replica_pass';

-- Create readonly user
CREATE USER usr_readonly WITH PASSWORD 'readonly_pass';

-- Grant necessary privileges
GRANT ALL PRIVILEGES ON DATABASE sakila TO usr_replica;

-- Grant connect on database
GRANT CONNECT ON DATABASE sakila TO usr_readonly;
EOF

# Create mysql-init/01-setup.sql
cat > mysql-init/01-setup.sql << 'EOF'
-- Grant replication privileges to usr_replica
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'usr_replica'@'%';
GRANT SELECT ON delphis_mediterranea.* TO 'usr_replica'@'%';

-- Create readonly user
CREATE USER IF NOT EXISTS 'usr_readonly'@'%' IDENTIFIED BY 'readonly_pass';
GRANT SELECT ON delphis_mediterranea.* TO 'usr_readonly'@'%';

-- Create tables in delphis_mediterranea database
USE delphis_mediterranea;

-- Create foo table (will be replicated due to limit_tables)
CREATE TABLE IF NOT EXISTS foo (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    tiny_flag TINYINT(1),
    payload TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Create bar table (will be skipped due to skip_tables)
CREATE TABLE IF NOT EXISTS bar (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    note VARCHAR(255)
) ENGINE=InnoDB;

-- Insert sample data
INSERT INTO foo (id, tiny_flag, payload, updated_at) VALUES
(1, 0, '2026-01-18_Sun_13.50-PM', '2026-01-18 18:46:23'),
(2, 1, '2026-01-18_Sun_13.51-PM', '2026-01-18 18:46:23')
ON DUPLICATE KEY UPDATE tiny_flag=VALUES(tiny_flag);

INSERT INTO bar (id, note) VALUES
(1, 'This table is skipped by pg_chameleon'),
(2, 'These rows will NOT appear in PostgreSQL'),
(3, 'Useful for verifying skip_tables behavior')
ON DUPLICATE KEY UPDATE note=VALUES(note);

FLUSH PRIVILEGES;
EOF

# Create config/config-example.yml
cat > config/config-example.yml << 'EOF'
---
# global settings
pid_dir: '~/.pg_chameleon/pid/'
log_dir: '~/.pg_chameleon/logs/'
log_dest: file
log_level: info
log_days_keep: 10
rollbar_key: ''
rollbar_env: ''

# type_override allows the user to override the default type conversion
# into a different one.
type_override:
  "tinyint(1)":
    override_to: boolean
    override_tables:
      - "*"

# postgres destination connection
pg_conn:
  host: "postgres"
  port: "5432"
  user: "usr_replica"
  password: "replica_pass"
  database: "sakila"
  charset: "utf8"

sources:
  mysql:
    db_conn:
      host: "mysql"
      port: "3306"
      user: "usr_replica"
      password: "replica_pass"
      charset: 'utf8'
      connect_timeout: 10
    schema_mappings:
      delphis_mediterranea: loxodonta_africana
    limit_tables:
      - delphis_mediterranea.foo
    skip_tables:
      - delphis_mediterranea.bar
    grant_select_to:
      - usr_readonly
    lock_timeout: "120s"
    my_server_id: 100
    replica_batch_size: 10000
    replay_max_rows: 10000
    batch_retention: '1 day'
    copy_max_memory: "300M"
    copy_mode: 'file'
    out_dir: /tmp
    sleep_loop: 1
    on_error_replay: continue
    on_error_read: continue
    auto_maintenance: "disabled"
    gtid_enable: false
    type: mysql
    skip_events:
      insert:
        - delphis_mediterranea.foo
      delete:
        - delphis_mediterranea
      update:
    keep_existing_schema: No
    net_read_timeout: 600
EOF

# Create README.md
cat > README.md << 'EOF'
# pg_chameleon Docker Setup

This Docker setup demonstrates MySQL to PostgreSQL replication using pg_chameleon with the official configuration structure.

## Structure

```
.
├── docker-compose.yml
├── Dockerfile
├── config/
│   └── config-example.yml
├── mysql-init/
│   └── 01-setup.sql
├── postgres-init/
│   └── 01-create-users.sql
└── README.md
```

## Configuration Details

**Databases:**
- MySQL source: `delphis_mediterranea` (schema)
- PostgreSQL target: `sakila` (database) with schema `loxodonta_africana`

**Users:**
- Replication user: `usr_replica` / `replica_pass`
- Read-only user: `usr_readonly` / `readonly_pass`

**Ports:**
- MySQL: `23306` (host) → `3306` (container)
- PostgreSQL: `25432` (host) → `5432` (container)

**Replication Rules:**
- Only table `delphis_mediterranea.foo` will be replicated (due to `limit_tables`)
- Table `delphis_mediterranea.bar` will be skipped (due to `skip_tables`)
- Schema mapping: `delphis_mediterranea` → `loxodonta_africana`

## Quick Start

1. **Build and start the containers:**
   ```bash
   docker compose up -d --build
   ```

2. **Wait for databases to be ready** (about 30 seconds):
   ```bash
   docker compose logs -f mysql postgres
   ```
   Press Ctrl+C when both databases show "ready to accept connections".

3. **Verify database setup:**
   ```bash
   # Check MySQL
   docker compose exec mysql mysql -u usr_replica -preplica_pass delphis_mediterranea -e "SHOW TABLES;"
   
   # Check PostgreSQL
   docker compose exec postgres psql -U postgres sakila -c "\du"
   ```

4. **Initialize pg_chameleon configuration:**
   ```bash
   docker compose exec chameleon chameleon set_configuration_files
   ```

5. **Grant schema permissions in PostgreSQL:**
   ```bash
   docker compose exec postgres psql -U postgres sakila << 'EOSQL'
   GRANT ALL ON SCHEMA public TO usr_replica;
   GRANT ALL ON SCHEMA loxodonta_africana TO usr_replica;
   GRANT USAGE ON SCHEMA loxodonta_africana TO usr_readonly;
   EOSQL
   ```

6. **Add the replica source:**
   ```bash
   docker compose exec chameleon chameleon add_source --config config-example
   ```

7. **Initialize the replica (initial load):**
   ```bash
   docker compose exec chameleon chameleon init_replica --config config-example
   ```

8. **Start the replica process:**
   ```bash
   docker compose exec chameleon chameleon start_replica --config config-example
   ```

## Useful Commands

### Check replica status
```bash
docker compose exec chameleon chameleon show_status --config config-example
```

### Stop replica
```bash
docker compose exec chameleon chameleon stop_replica --config config-example
```

### Drop replica
```bash
docker compose exec chameleon chameleon drop_replica --config config-example
```

### View logs
```bash
docker compose exec chameleon chameleon show_logs --config config-example
```

### Access MySQL
```bash
# As replication user
docker compose exec mysql mysql -u usr_replica -preplica_pass delphis_mediterranea

# As root
docker compose exec mysql mysql -u root -prootpass
```

### Access PostgreSQL
```bash
# As postgres superuser
docker compose exec postgres psql -U postgres sakila

# As replication user
docker compose exec postgres psql -U usr_replica sakila
```

### Access chameleon shell
```bash
docker compose exec chameleon bash
```

## Testing Replication

1. **Verify initial data was replicated:**
   ```bash
   # Check in PostgreSQL (only foo table should be there)
   docker compose exec postgres psql -U postgres sakila -c "SELECT * FROM loxodonta_africana.foo;"
   
   # bar table should NOT exist
   docker compose exec postgres psql -U postgres sakila -c "SELECT * FROM loxodonta_africana.bar;"
   ```

2. **Insert new data in MySQL:**
   ```bash
   docker compose exec mysql mysql -u usr_replica -preplica_pass delphis_mediterranea -e "
   INSERT INTO foo (tiny_flag, payload) VALUES (1, 'New record from MySQL');
   "
   ```

3. **Verify replication (wait a few seconds):**
   ```bash
   docker compose exec postgres psql -U postgres sakila -c "SELECT * FROM loxodonta_africana.foo ORDER BY id;"
   ```

4. **Test skip_tables behavior:**
   ```bash
   # Insert into bar (should NOT replicate)
   docker compose exec mysql mysql -u usr_replica -preplica_pass delphis_mediterranea -e "
   INSERT INTO bar (note) VALUES ('This will not replicate');
   "
   
   # Verify bar doesn't exist in PostgreSQL
   docker compose exec postgres psql -U postgres sakila -c "\dt loxodonta_africana.*"
   ```

## Configuration File Details

The `config/config-example.yml` includes:

- **Global settings**: Log directories, log levels, pid directories
- **Type overrides**: `TINYINT(1)` → `BOOLEAN` conversion
- **Schema mappings**: `delphis_mediterranea` → `loxodonta_africana`
- **Table filters**: 
  - `limit_tables`: Only replicate `foo` table
  - `skip_tables`: Ignore `bar` table
- **Skip events**: Control which DML operations to skip per table
- **Network timeouts**: Connection and read timeouts

## MySQL Binary Log Configuration

The MySQL container is configured with:
- `server-id=100`: Server identifier for replication
- `binlog-format=ROW`: Required for row-based replication
- `log-bin=mysql-bin`: Binary log file prefix
- `binlog-row-image=FULL`: Full row images in binary log

## Data Persistence

Data is persisted in Docker volumes:
- `mysql_data`: MySQL database files
- `postgres_data`: PostgreSQL database files
- `chameleon_logs`: pg_chameleon logs

## Cleanup

```bash
# Stop containers
docker compose down

# Remove volumes (deletes all data)
docker compose down -v
```

## Troubleshooting

### "connection to server at localhost refused"
The config file must use Docker service names (`postgres`, `mysql`) not `localhost`. This is already configured correctly in the generated files.

### "pg_chameleon cannot be run as root"
The container runs as non-root user `chameleon` (uid 1000). This is already configured.

### "relation does not exist"
Make sure you granted permissions on the target schema:
```bash
docker compose exec postgres psql -U postgres sakila -c "GRANT ALL ON SCHEMA loxodonta_africana TO usr_replica;"
```

### Check if replication is working
```bash
docker compose exec chameleon chameleon show_status --config config-example
```

## Notes

- The container runs as user `chameleon` (uid 1000) for security
- Only the `foo` table is replicated due to `limit_tables` configuration
- The `bar` table is explicitly skipped
- `TINYINT(1)` columns are converted to `BOOLEAN` in PostgreSQL
- Network ports are mapped to avoid conflicts (23306, 25432)
- The replica process must be started manually and runs in foreground
EOF

# Create .gitignore
cat > .gitignore << 'EOF'
# Docker volumes
mysql-init/*.sql

# Logs
*.log

# OS files
.DS_Store
Thumbs.db
EOF

echo ""
echo "✅ All files created successfully!"
echo ""
echo "Directory structure:"
tree -L 2 2>/dev/null || find . -maxdepth 2 -not -path '*/\.*' | sed 's|^\./||' | sort
echo ""
echo "Next steps:"
echo "1. Run: docker compose up -d --build"
echo "2. Follow the instructions in README.md"
echo ""