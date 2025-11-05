from django.db import models
from django.contrib.auth.models import User

class Filer(models.Model):
    """
    Model to store file metadata and text content for editing.
    The actual file is stored in the file system (MEDIA_ROOT).
    """
    # The file is stored in a subfolder relative to MEDIA_ROOT (i.e., 'upload/...')
    file = models.FileField(upload_to='') 
    filename = models.CharField(max_length=255, unique=False) # Not truly unique due to overwrite feature, but good for display
    uploaded_at = models.DateTimeField(auto_now_add=True)
    
    # Text content of the file, only populated for files that are detected as text.
    body = models.TextField(blank=True, null=True)
    
    # Metadata
    length_kb = models.IntegerField(default=0)
    filetype = models.CharField(max_length=100, default='unknown')
    
    # Authorization
    owner = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.filename

    def get_file_url(self):
        # A utility to get the URL to the file
        return self.file.url

    class Meta:
        ordering = ['-uploaded_at'] # List in descending order by upload time
