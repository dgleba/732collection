import paho.mqtt.client as mqtt

def on_message(client, userdata, message):
    print(f"Received message: {message.payload.decode()} on topic {message.topic}")

client = mqtt.Client()
client.username_pw_set("mquser", "2430")
client.on_message = on_message
client.connect("localhost", 1883, 60)
client.subscribe("testtop01")
client.loop_forever()

