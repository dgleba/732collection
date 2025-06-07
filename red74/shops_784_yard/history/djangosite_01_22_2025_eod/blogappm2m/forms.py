from django import forms
from blogappm2m.models import TagTbl
from . import models


class PostedFromTblForm(forms.ModelForm):
    class Meta:
        model = models.PostedFromTbl
        fields = [
            "name",
        ]


class TagTblForm(forms.ModelForm):
    class Meta:
        model = models.TagTbl
        fields = [
            "name",
        ]


class PostTblForm(forms.ModelForm):
    class Meta:
        model = models.PostTbl
        fields = [
            "title",
            "body",
            "post_tag_mm",
            "postedfrom_id",
        ]

    def __init__(self, *args, **kwargs):
        super(PostTblForm, self).__init__(*args, **kwargs)
        self.fields["post_tag_mm"].queryset = Tagtbl.objects.all()
        self.fields["postedfrom_id"].queryset = TagTbl.objects.all()

