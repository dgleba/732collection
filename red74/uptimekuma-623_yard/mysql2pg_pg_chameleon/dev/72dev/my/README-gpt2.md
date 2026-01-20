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
