
import paho.mqtt.client as mqtt
import sqlite3
import json

# Set up SQLite database
conn = sqlite3.connect('mqtt_messages.dbsqlite')
cursor = conn.cursor()
cursor.execute('''CREATE TABLE IF NOT EXISTS messages
                  (id INTEGER PRIMARY KEY AUTOINCREMENT,
                   topic TEXT,
                   payload TEXT,
                   timestamp DATETIME DEFAULT CURRENT_TIMESTAMP)''')

def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    client.subscribe("#")  # Subscribe to all topics

def on_message(client, userdata, msg):
    topic = msg.topic
    payload = msg.payload.decode()
    
    # Insert message into database
    cursor.execute("INSERT INTO messages (topic, payload) VALUES (?, ?)", (topic, payload))
    conn.commit()
    print(f"Stored message: {topic} - {payload}")

client = mqtt.Client()
client.username_pw_set("mquser", "2430")
client.on_connect = on_connect
client.on_message = on_message

client.connect("localhost", 1883, 60)

client.loop_forever()
