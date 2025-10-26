from django.db import models

# Create your models here.

from django.db import models

class File(models.Model):
    path = models.TextField()
    filename = models.TextField()
    size = models.IntegerField()
    modified_ts = models.TextField()

    class Meta:
        db_table = 'files'  # Matches the existing table name
        managed = False     # Prevent Django from trying to create or alter this table

    def __str__(self):
        return self.filename
