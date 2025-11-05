from django import forms
from .models import UploadedFile

class FileUploadForm(forms.ModelForm):
    class Meta:
        model = UploadedFile
        fields = ['file']

class FileEditForm(forms.ModelForm):
    class Meta:
        model = UploadedFile
        fields = ['name']
