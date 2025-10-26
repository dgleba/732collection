from django.contrib import admin

# Register your models here.

from django.contrib import admin
from .models import File

@admin.register(File)
class FileAdmin(admin.ModelAdmin):
    list_display = ('filename', 'path', 'size', 'modified_ts')
    search_fields = ('filename', 'path')
    ordering = ('-modified_ts',)
