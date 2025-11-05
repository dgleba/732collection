from django import forms
from .models import FileBag

class FileBagForm(forms.ModelForm):
    class Meta:
        model = FileBag
        fields = ['name', 'file']

class CodeMirrorForm(forms.Form):
    content = forms.CharField(widget=forms.Textarea(attrs={'id': 'codemirror'}))
