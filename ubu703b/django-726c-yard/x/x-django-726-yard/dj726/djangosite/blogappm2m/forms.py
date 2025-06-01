from django import forms
from blogappm2m.models import PostedFromTbl
from blogappm2m.models import TagTbl
from . import models


class PostedFromTblForm(forms.ModelForm):
    class Meta:
        model = models.PostedFromTbl
        fields = [
            "name",
        ]


class PostTblForm(forms.ModelForm):
    class Meta:
        model = models.PostTbl
        fields = [
            "body",
            "title",
            "pic",
            # "postedfrom",
            # "tags",
        ]

    def __init__(self, *args, **kwargs):
        super(PostTblForm, self).__init__(*args, **kwargs)
        self.fields["postedfrom"].queryset = PostedFromTbl.objects.all()
        self.fields["tags"].queryset = TagTbl.objects.all()



class TagTblForm(forms.ModelForm):
    class Meta:
        model = models.TagTbl
        fields = [
            "name",
        ]
