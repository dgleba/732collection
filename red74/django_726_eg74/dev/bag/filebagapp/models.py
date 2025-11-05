from django.db import models

class FileBag(models.Model):
    title = models.CharField(max_length=200)
    file = models.FileField(upload_to='upload/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title
    
    def is_text_file(self):
        """Helper to check if we should show the CodeMirror editor."""
        if not self.file:
            return True # New files are text files
        name = self.file.name.lower()
        return name.endswith(('.txt', '.md', '.py', '.js', '.css', '.html', '.json', '.xml'))
