import paho.mqtt.client as mqtt

client = mqtt.Client()
client.username_pw_set("mquser", "2430")
client.connect("localhost", 1883, 60)

# Publish a message
client.publish("testtop01", "msg31")

# Disconnect from the broker
client.disconnect()
