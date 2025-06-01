from rest_framework import serializers

from . import models


class PostedFromTblSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.PostedFromTbl
        fields = [
            "last_updated",
            "created",
            "name",
        ]

class PostTblSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.PostTbl
        fields = [
            "created_at",
            "updated_at",
            "body",
            "title",
            "pic",
            "postedfrom",
            "tags",
        ]

class TagTblSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.TagTbl
        fields = [
            "created",
            "name",
            "last_updated",
        ]
