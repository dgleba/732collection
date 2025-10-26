from rest_framework import viewsets, permissions, filters

from . import serializers
from . import models

# search --  https://medium.com/swlh/searching-in-django-rest-framework-45aad62e7782
# DjangoModelPermissions --    https://levelup.gitconnected.com/django-user-groups-with-django-rest-framework-f6f2bab43499

class PostViewSet(viewsets.ModelViewSet):
    """ViewSet for the Post class"""

    search_fields = [
        'title',
        'body',
        ]
    filter_backends = (filters.SearchFilter,)

    queryset = models.Post.objects.all()
    serializer_class = serializers.PostSerializer
    permission_classes = [permissions.IsAuthenticated, permissions.DjangoModelPermissions]

