from rest_framework import viewsets, permissions

from . import serializers
from . import models


class PostedFromTblViewSet(viewsets.ModelViewSet):
    """ViewSet for the PostedFromTbl class"""

    queryset = models.PostedFromTbl.objects.all()
    serializer_class = serializers.PostedFromTblSerializer
    permission_classes = [permissions.IsAuthenticated]


class TagTblViewSet(viewsets.ModelViewSet):
    """ViewSet for the TagTbl class"""

    queryset = models.TagTbl.objects.all()
    serializer_class = serializers.TagTblSerializer
    permission_classes = [permissions.IsAuthenticated]


class PostTblViewSet(viewsets.ModelViewSet):
    """ViewSet for the PostTbl class"""

    queryset = models.PostTbl.objects.all()
    serializer_class = serializers.PostTblSerializer
    permission_classes = [permissions.IsAuthenticated]
