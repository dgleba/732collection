from django import forms
from .models import Filer

class FileUploadForm(forms.ModelForm):
    """Form to handle file uploads."""
    class Meta:
        model = Filer
        fields = ('file',)
        # Note: 'filename', 'owner', 'body', etc. are handled in the view.

class ExternalFileReuploadForm(forms.Form):
    """Form used to re-upload a file after external editing."""
    file = forms.FileField()
