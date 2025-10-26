from rest_framework import serializers

from . import models


class PostedFromTblSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.PostedFromTbl
        fields = [
            "created",
            "last_updated",
            "name",
        ]

class TagTblSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.TagTbl
        fields = [
            "created",
            "last_updated",
            "name",
        ]

class PostTblSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.PostTbl
        fields = [
            "title",
            "updated_at",
            "created_at",
            "body",
            "post_tag_mm",
            "postedfrom_id",
        ]
