from django.contrib import admin
from .models import FileBag

@admin.register(FileBag)
class FileBagAdmin(admin.ModelAdmin):
    list_display = ('name', 'created_at')
