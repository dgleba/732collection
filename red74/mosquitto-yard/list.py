
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('mqtt_messages.dbsqlite')
cursor = conn.cursor()

# Execute the SELECT query
cursor.execute("SELECT * FROM messages")

# Fetch all rows
rows = cursor.fetchall()

# Print the total number of rows
print(f"Total number of messages: {len(rows)}")

# Print each row
for row in rows:
    print(f"ID: {row[0]}, Topic: {row[1]}, Payload: {row[2]}, Timestamp: {row[3]}")

# Close the connection
conn.close()
