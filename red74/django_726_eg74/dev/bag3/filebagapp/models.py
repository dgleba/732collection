from django.db import models

class FileBag(models.Model):
    name = models.CharField(max_length=255, unique=True)
    file = models.FileField(upload_to='upload/')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
