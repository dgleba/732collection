from channels.consumer import SyncConsumer


class blogappm2mConsumer(SyncConsumer):

    def app1_message(self, message):
        # do something with message
        pass