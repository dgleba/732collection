from rest_framework import serializers

from . import models


class PostSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Post
        fields = [
            "id",
            "created",
            "last_updated",
            "title",
            "body",
        ]
