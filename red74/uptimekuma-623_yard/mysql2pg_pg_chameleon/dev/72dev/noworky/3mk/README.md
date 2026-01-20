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
