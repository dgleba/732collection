#!/bin/sh
# write-mysql-init-files.sh
set -e

# Create init folder if it doesn't exist
mkdir -p ./mysql-init

# 01-create-table.sql
cat > ./mysql-init/01-create-table.sql <<'EOF'
CREATE TABLE IF NOT EXISTS test_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
EOF

# 02-insert-data.sql
cat > ./mysql-init/02-insert-data.sql <<'EOF'
INSERT INTO test_table (name) VALUES ('Alice'), ('Bob'), ('Charlie');
EOF

echo "MySQL init SQL files created in ./mysql-init"
