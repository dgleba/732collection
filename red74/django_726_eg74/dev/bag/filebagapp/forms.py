from django import forms
from .models import FileBag

class FileBagTextForm(forms.ModelForm):
    # This field doesn't exist on the model, it's just for the form.
    # We will manually read/write this to the file in the view.
    content = forms.CharField(
        widget=forms.Textarea(attrs={'id': 'codemirror-editor'}),
        required=False
    )
    
    class Meta:
        model = FileBag
        fields = ['title', 'file'] # Show title and file upload

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # If we are editing an existing text file, load its content
        if self.instance and self.instance.pk and self.instance.file and self.instance.is_text_file():
            try:
                with self.instance.file.open('r') as f:
                    self.initial['content'] = f.read()
            except IOError:
                self.initial['content'] = "Error: Could not read file."
