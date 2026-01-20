#!/bin/bash


notes001_fuction () {
pwd

#
#
#

}


# Create pg_chameleon Docker setup
# This script creates all necessary files for the Docker environment

set -e

echo "Creating pg_chameleon Docker setup..."

# Create directory structure
mkdir -p config
mkdir -p mysql-init

# Create docker-compose.yml
cat > docker-compose.yml << 'EOF'
services:
  mysql:
    image: mysql:8.0
    container_name: chameleon_mysql
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: sakila
      MYSQL_USER: chameleon_user
      MYSQL_PASSWORD: chameleon_pass
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql
      - ./mysql-init:/docker-entrypoint-initdb.d
    command: --binlog-format=ROW --server-id=1 --log-bin=mysql-bin --binlog-row-image=FULL
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
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
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

# Create config/config-example.yml
cat > config/config-example.yml << 'EOF'
---
# Global settings
pid_dir: '~/.pg_chameleon/pid/'
log_dir: '~/.pg_chameleon/logs/'
log_dest: file
log_level: info
log_days_keep: 10
rollbar_key: ''
rollbar_env: ''
dump_json: No

# type_override allows the user to override the default type conversion
# into a different one.
type_override:
  #"tinyint(1)":
  #  override_to: boolean
  #  override_tables:
  #    - "*"

# postgres destination connection
pg_conn:
  host: "postgres"
  port: "5432"
  user: "postgres"
  password: "postgres"
  database: "sakila"
  charset: "utf8"

sources:
  mysql:
    readers: 4
    writers: 4
    db_conn:
      host: "mysql"
      port: "3306"
      user: "chameleon_user"
      password: "chameleon_pass"
      charset: 'utf8'
      connect_timeout: 10
    
    schema_mappings:
      sakila:
        schema: sakila
        limit_tables:
        skip_tables:
    
    replica_batch_size: 10000
    replay_max_rows: 10000
    
    batch_retention: 1
    
    copy_max_memory: "300M"
    copy_mode: 'file'
    
    out_dir: /tmp
    
    sleep_loop: 1
    
    on_error_replay: continue
    on_error_read: continue
    
    auto_maintenance: "disabled"
    
    gtid_enable: false
    
    type: mysql
    
    keep_existing_schema: No
    
    migrate_default_value: Yes
    
    grant_select_to:
      - usr_migration
EOF

# Create README.md
cat > README.md << 'EOF'
# pg_chameleon Docker Setup

This Docker setup demonstrates MySQL to PostgreSQL replication using pg_chameleon, based on the official documentation example.

## Structure

```
.
├── docker-compose.yml
├── Dockerfile
├── config/
│   └── config-example.yml
├── mysql-init/
│   └── (optional SQL initialization files)
└── README.md
```

## Quick Start

1. **Build and start the containers:**
   ```bash
   docker compose up -d --build
   ```

2. **Wait for databases to be ready** (about 30 seconds):
   ```bash
   docker compose logs -f mysql postgres
   ```
   Press Ctrl+C when you see both databases are ready.

3. **Initialize pg_chameleon configuration:**
   ```bash
   docker compose exec chameleon chameleon set_configuration_files
   ```

4. **Create the replication user on PostgreSQL:**
   ```bash
   docker compose exec postgres psql -U postgres -c "CREATE USER usr_migration WITH PASSWORD 'migration_pass';"
   docker compose exec postgres psql -U postgres sakila -c "GRANT ALL ON SCHEMA public TO usr_migration;"
   ```

5. **Add the replica source:**
   ```bash
   docker compose exec chameleon chameleon add_source --config config-example
   ```

6. **Initialize the replica (initial load):**
   ```bash
   docker compose exec chameleon chameleon init_replica --config config-example
   ```

7. **Start the replica process:**
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
docker compose exec mysql mysql -u chameleon_user -pchameleon_pass sakila
```

### Access PostgreSQL
```bash
docker compose exec postgres psql -U postgres sakila
```

### Access chameleon shell
```bash
docker compose exec chameleon bash
```

## Testing Replication

1. **Insert data in MySQL:**
   ```bash
   docker compose exec mysql mysql -u chameleon_user -pchameleon_pass sakila -e "
   CREATE TABLE test_table (
     id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(100),
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   INSERT INTO test_table (name) VALUES ('Test 1'), ('Test 2'), ('Test 3');
   "
   ```

2. **Check data in PostgreSQL:**
   ```bash
   docker compose exec postgres psql -U postgres sakila -c "SELECT * FROM sakila.test_table;"
   ```

## Configuration

The main configuration file is in `config/config-example.yml`. Key settings:

- **MySQL connection**: Points to the `mysql` container
- **PostgreSQL connection**: Points to the `postgres` container
- **Schema mapping**: Replicates the `sakila` database
- **Replication settings**: Batch sizes, error handling, etc.

## MySQL Binary Log Configuration

The MySQL container is configured with:
- `binlog-format=ROW`: Required for replication
- `server-id=1`: Unique server identifier
- `log-bin=mysql-bin`: Binary log prefix
- `binlog-row-image=FULL`: Full row images in binlog

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

### "pg_chameleon cannot be run as root"
This error is now fixed by running chameleon as a non-root user (uid 1000).

### Connection refused errors
Make sure both MySQL and PostgreSQL are fully started before running chameleon commands. Check logs with:
```bash
docker compose logs mysql postgres
```

### Permission denied errors
The chameleon user (uid 1000) needs write access to mounted volumes. The config directory is mounted with proper permissions.

## Notes

- The chameleon container runs as user `chameleon` (uid 1000) for security
- The container uses `tail -f /dev/null` to keep running, allowing you to exec into it
- Adjust memory settings in the config file based on your data volume
- The replica process runs in the foreground when started
- For production use, consider running the replica as a background service or systemd unit
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