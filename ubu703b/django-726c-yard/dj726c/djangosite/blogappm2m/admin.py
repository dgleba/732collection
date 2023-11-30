from django.contrib import admin
from django import forms

from . import models


class PostedFromTblAdminForm(forms.ModelForm):

    class Meta:
        model = models.PostedFromTbl
        fields = "__all__"


class PostedFromTblAdmin(admin.ModelAdmin):
    form = PostedFromTblAdminForm
    list_display = [
        "last_updated",
        "created",
        "name",
    ]
    readonly_fields = [
        "last_updated",
        "created",
    ]
    fields = [
        "name",
    ]
    search_fields = [
        "name",
    ]

class PostTblAdminForm(forms.ModelForm):

    class Meta:
        model = models.PostTbl
        fields = "__all__"


class PostTblAdmin(admin.ModelAdmin):
    form = PostTblAdminForm
    list_display = [
        "created_at",
        "updated_at",
        "body",
        "title",
        "pic",
    ]
    readonly_fields = [
        "created_at",
        "updated_at",
    ]
    search_fields = [
        "tags",
        "postedfrom",
        "title",
        "body",
    ]
    fields = [
        "title",
        "body",
        "pic",
        "tags",
        "postedfrom",
    ]
    autocomplete_fields = [
        "tags",
        "postedfrom",
    ]

class TagTblAdminForm(forms.ModelForm):

    class Meta:
        model = models.TagTbl
        fields = "__all__"


class TagTblAdmin(admin.ModelAdmin):
    form = TagTblAdminForm
    list_display = [
        "created",
        "name",
        "last_updated",
    ]
    readonly_fields = [
        "created",
        "last_updated",
    ]
    fields = [
        "name",
    ]
    search_fields = [
        "name",
    ]

admin.site.register(models.PostedFromTbl, PostedFromTblAdmin)
admin.site.register(models.PostTbl, PostTblAdmin)
admin.site.register(models.TagTbl, TagTblAdmin)
