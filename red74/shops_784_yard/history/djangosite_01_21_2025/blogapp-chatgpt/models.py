from django.db import models
from django.conf import settings

class Post(models.Model):
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)
    title = models.CharField(max_length=230)
    body = models.TextField(max_length=32100, default=None, blank=True, null=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, default=None, blank=True, null=True, on_delete=models.DO_NOTHING)

