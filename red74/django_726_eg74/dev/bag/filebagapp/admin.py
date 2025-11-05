from django.contrib import admin
from django.utils.html import format_html
from django.urls import reverse
from .models import FileBag

@admin.register(FileBag)
class FileBagAdmin(admin.ModelAdmin):
    list_display = ('title', 'file', 'updated_at', 'edit_link')
    search_fields = ('title', 'file')

    def edit_link(self, obj):
        """Add a link to our custom edit view."""
        if not obj.pk:
            return ""
        
        # Point to our custom view, not the admin change view
        url = reverse('filebag:edit', args=[obj.pk])
        return format_html('<a href="{}">Edit Content</a>', url)
    
    edit_link.short_description = "Edit Content"

    # --- PERMISSIONS ---
    # This checks that the user is in the 'bag' group

    def has_view_permission(self, request, obj=None):
        return request.user.groups.filter(name='bag').exists()

    def has_add_permission(self, request):
        return request.user.groups.filter(name='bag').exists()

    def has_change_permission(self, request, obj=None):
        return request.user.groups.filter(name='bag').exists()

    def has_delete_permission(self, request, obj=None):
        return request.user.groups.filter(name='bag').exists()

    # --- CUSTOM ACTIONS ---
    
    actions = ['rename_file_title']

    def rename_file_title(self, request, queryset):
        # This is a basic example. You'd typically use a form
        # to ask for the new name.
        for obj in queryset:
            obj.title = f"RENAMED - {obj.title}"
            obj.save()
        self.message_user(request, "Selected files renamed.")
    
    rename_file_title.short_description = "Rename selected files (add prefix)"
