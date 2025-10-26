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
        "created",
        "last_updated",
        "name",
    ]
    readonly_fields = [
        "created",
        "last_updated",
    ]
    fields = [
        "name",
    ]


class TagTblAdminForm(forms.ModelForm):

    class Meta:
        model = models.TagTbl
        fields = "__all__"


class TagTblAdmin(admin.ModelAdmin):
    form = TagTblAdminForm
    list_display = [
        "created",
        "last_updated",
        "name",
    ]
    readonly_fields = [
        "created",
        "last_updated",
    ]
    fields = [
        "name",
    ]


class PostTblAdminForm(forms.ModelForm):

    class Meta:
        model = models.PostTbl
        fields = "__all__"


class PostTblAdmin(admin.ModelAdmin):
    form = PostTblAdminForm
    list_display = [
        "title",
        "updated_at",
        "created_at",
        "body",
    ]
    readonly_fields = [
        "updated_at",
        "created_at",
    ]

fields = [
        "title",
        "body",
    ]


admin.site.register(models.PostedFromTbl, PostedFromTblAdmin)
admin.site.register(models.TagTbl, TagTblAdmin)
admin.site.register(models.PostTbl, PostTblAdmin)
