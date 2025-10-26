from django.conf.urls import url

from channels.routing import ChannelNameRouter, ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack

from djangoproj.consumers import djangoproj_WebSocketConsumer

# Consumer Imports
from toolbreakapp624c.consumers import toolbreakapp624cConsumer
from blogappm2m.consumers import blogappm2mConsumer


application = ProtocolTypeRouter({

    # WebSocket handler
    "websocket": AuthMiddlewareStack(
        URLRouter([
            url(r"^ws/$", djangoproj_WebSocketConsumer.as_asgi()),
        ])
    ),
    "channel": ChannelNameRouter({
        "toolbreakapp624c": toolbreakapp624cConsumer,    "blogappm2m": blogappm2mConsumer,
    })
})
