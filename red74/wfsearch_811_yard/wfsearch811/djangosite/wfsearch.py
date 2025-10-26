"""
usage:
cd /ap/dkr/732collection/red74/wfsearch_811_yard/wfsearch811/djangosite; /usr/bin/python wfsearch.py;

cron:

58 5,13 * * * bash -c "cd /ap/dkr/732collection/red74/wfsearch_811_yard/wfsearch811/djangosite && /usr/bin/python3 wfsearch.py"


"""

import os
import sqlite3
import time

# Set the root directory to scan
root_dir = "/am/cruc4tb/koofry"

# Create SQLite DB
conn = sqlite3.connect("./sqlitedb/wfsearch-files.db")
cursor = conn.cursor()

cursor.execute("DROP TABLE IF EXISTS files")

# Create table with primary key and indexes
cursor.execute("""
CREATE TABLE IF NOT EXISTS files (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    path TEXT,
    filename TEXT,
    size INTEGER,
    modified_ts TEXT
)
""")
# Create indexes on all columns except the primary key
cursor.execute("CREATE INDEX IF NOT EXISTS idx_path ON files(path)")
cursor.execute("CREATE INDEX IF NOT EXISTS idx_filename ON files(filename)")
cursor.execute("CREATE INDEX IF NOT EXISTS idx_size ON files(size)")
cursor.execute("CREATE INDEX IF NOT EXISTS idx_modified_ts ON files(modified_ts)")

# Truncate table
cursor.execute("DELETE FROM files")
conn.commit()
cursor.execute("VACUUM")
conn.commit()

# Walk through files
for dirpath, _, filenames in os.walk(root_dir):
    for fname in filenames:
        full_path = os.path.join(dirpath, fname)
        try:
            stat = os.stat(full_path)
            cursor.execute("""
                INSERT INTO files (path, filename, size, modified_ts)
                VALUES (?, ?, ?, ?)
            """, (
                full_path,
                fname,
                stat.st_size,
                time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(stat.st_mtime))
            ))
        except Exception as e:
            print(f"Skipped {full_path}: {e}")

conn.commit()
conn.close()
