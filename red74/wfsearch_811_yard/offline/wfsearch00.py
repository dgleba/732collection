"""
usage:
cd /ap/dkr/732collection/red74/wfsearch_811_yard/wfsearch811/djangosite; python wfsearch.py;


"""

import os
import sqlite3
import time

# Set the root directory to scan
root_dir = "/am/cruc4tb/koofry"

# Create SQLite DB
conn = sqlite3.connect("./sqlitedb/wfsearch-files.db")
cursor = conn.cursor()

# Create table
cursor.execute("""
CREATE TABLE IF NOT EXISTS files (
    path TEXT,
    filename TEXT,
    size INTEGER,
    modified_ts TEXT
)
""")
cursor.execute("DELETE FROM files")  # Truncate table
conn.commit()
cursor.execute("VACUUM")
conn.commit()

# Walk through files
for dirpath, _, filenames in os.walk(root_dir):
    for fname in filenames:
        full_path = os.path.join(dirpath, fname)
        try:
            stat = os.stat(full_path)
            cursor.execute("INSERT INTO files VALUES (?, ?, ?, ?)", (
                full_path,
                fname,
                stat.st_size,
                time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(stat.st_mtime))
            ))
        except Exception as e:
            print(f"Skipped {full_path}: {e}")

conn.commit()
conn.close()
