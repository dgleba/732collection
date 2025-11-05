
#!/bin/bash


# https://gemini.google.com/app/877fa591758600ad


# write django app called filebagapp. It will be independent of the project - it is pluggable.
# -can create or edit file and are stored in /upload folder
# -list them, rename them.
# -text files allow editing in codemirror text editor.
# -use built-in user login and permissions system so login is required and must be part of 'bag' group
# -add another edit feature to allow editing file by downloading the file to local temp and open it in default txt editor. when saved, upload the file back to /upload.
# -can it all be done in the admin?


echo "Creating 'filebagapp' directory and files..."

# --- Create Directory Structure ---
mkdir -p filebagapp/management/commands
mkdir -p filebagapp/templates/filebagapp
mkdir -p filebagapp/migrations

# --- Create Empty Init Files ---
touch filebagapp/__init__.py
touch filebagapp/management/__init__.py
touch filebagapp/management/commands/__init__.py
touch filebagapp/migrations/__init__.py

# --- Create models.py ---
cat << EOF > filebagapp/models.py
from django.db import models

class FileBag(models.Model):
    title = models.CharField(max_length=200)
    file = models.FileField(upload_to='upload/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title
    
    def is_text_file(self):
        """Helper to check if we should show the CodeMirror editor."""
        if not self.file:
            return True # New files are text files
        name = self.file.name.lower()
        return name.endswith(('.txt', '.md', '.py', '.js', '.css', '.html', '.json', '.xml'))
EOF

# --- Create admin.py ---
cat << EOF > filebagapp/admin.py
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
EOF

# --- Create forms.py ---
cat << EOF > filebagapp/forms.py
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
EOF

# --- Create views.py ---
cat << EOF > filebagapp/views.py
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import ListView, UpdateView, CreateView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.core.files.base import ContentFile

from .models import FileBag
from .forms import FileBagTextForm
import os

class BagPermissionMixin(LoginRequiredMixin, UserPassesTestMixin):
    """Checks for login and 'bag' group membership."""
    def test_func(self):
        return self.request.user.groups.filter(name='bag').exists()

class FileBagListView(BagPermissionMixin, ListView):
    model = FileBag
    template_name = 'filebagapp/file_list.html'
    context_object_name = 'files'

class FileBagCreateView(BagPermissionMixin, CreateView):
    model = FileBag
    form_class = FileBagTextForm
    template_name = 'filebagapp/file_form.html'
    success_url = reverse_lazy('filebag:list')

    def form_valid(self, form):
        # Save the model instance
        self.object = form.save()
        
        # Check if user wrote content in the CodeMirror editor
        content = form.cleaned_data.get('content')
        if content:
            # If they didn't upload a file, create one
            if not self.object.file:
                # Use the title to create a filename
                filename = f"{self.object.title.replace(' ', '_')}.txt"
                self.object.file.save(filename, ContentFile(content))
        
        return super().form_valid(form)

class FileBagEditView(BagPermissionMixin, UpdateView):
    model = FileBag
    form_class = FileBagTextForm
    template_name = 'filebagapp/file_form.html'
    success_url = reverse_lazy('filebag:list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Pass this to the template to conditionally show CodeMirror
        context['is_text_file'] = self.object.is_text_file()
        return context

    def form_valid(self, form):
        # Save the model (e.g., if title was changed)
        self.object = form.save()
        
        # If it's a text file, save the content from the editor
        if self.object.is_text_file():
            content = form.cleaned_data.get('content')
            if self.object.file:
                # Delete the old file before saving the new one
                filepath = self.object.file.path
                if os.path.exists(filepath):
                    os.remove(filepath)
            
            # Save the new content
            filename = self.object.file.name.split('/')[-1]
            self.object.file.save(filename, ContentFile(content))

        return super().form_valid(form)
EOF

# --- Create urls.py ---
cat << EOF > filebagapp/urls.py
from django.urls import path
from . import views

app_name = 'filebagapp'

urlpatterns = [
    path('', views.FileBagListView.as_view(), name='list'),
    path('new/', views.FileBagCreateView.as_view(), name='create'),
    path('edit/<int:pk>/', views.FileBagEditView.as_view(), name='edit'),
]
EOF

# --- Create management command ---
cat << EOF > filebagapp/management/commands/create_bag_group.py
from django.core.management.base import BaseCommand
from django.contrib.auth.models import Group

class Command(BaseCommand):
    help = "Creates the 'bag' user group"

    def handle(self, *args, **options):
        group, created = Group.objects.get_or_create(name='bag')
        if created:
            self.stdout.write(self.style.SUCCESS("Successfully created 'bag' group"))
        else:
            self.stdout.write("Group 'bag' already exists")
EOF

# --- Create templates ---
cat << EOF > filebagapp/templates/filebagapp/_base.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FileBag</title>
    <style>
        body { font-family: sans-serif; margin: 2em; }
        nav { margin-bottom: 1em; }
        .CodeMirror { border: 1px solid #ccc; height: 400px; }
    </style>
    {% block head %}{% endblock %}
</head>
<body>
    <nav>
        <a href="{% url 'filebag:list' %}">File List</a> |
        <a href="{% url 'filebag:create' %}">New File</a> |
        <a href="{% url 'admin:index' %}">Admin</a>
    </nav>
    <h1>{% block title %}{% endblock %}</h1>
    {% block content %}{% endblock %}
</body>
</html>
EOF

cat << EOF > filebagapp/templates/filebagapp/file_list.html
{% extends "filebagapp/_base.html" %}

{% block title %}My Files{% endblock %}

{% block content %}
    <ul>
        {% for file in files %}
            <li>
                <strong>{{ file.title }}</strong>
                {% if file.file %}
                    (<a href="{{ file.file.url }}" download>{{ file.file.name }}</a>)
                {% endif %}
                - <a href="{% url 'filebag:edit' file.pk %}">Edit</a>
            </li>
        {% empty %}
            <li>No files yet.</li>
        {% endfor %}
    </ul>
    <p>
        <a href="{% url 'filebag:create' %}">Create New File</a>
    </p>
{% endblock %}
EOF

cat << EOF > filebagapp/templates/filebagapp/file_form.html
{% extends "filebagapp/_base.html" %}

{% block title %}{% if object %}Edit {{ object.title }}{% else %}Create New File{% endif %}{% endblock %}

{% block head %}
    {% if is_text_file or not object %}
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.3/codemirror.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.3/codemirror.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.3/mode/xml/xml.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.3/mode/javascript/javascript.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.3/mode/css/css.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.3/mode/python/python.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.3/mode/markdown/markdown.min.js"></script>
    {% endif %}
{% endblock %}

{% block content %}
    <form method="post" enctype="multipart/form-data">
        {% csrf_token %}
        
        <p>
            <label for="{{ form.title.id_for_label }}">Title:</label>
            {{ form.title }}
        </p>

        {% if not object or not object.file %}
        <p>
            <label for="{{ form.file.id_for_label }}">Or Upload File:</label>
            {{ form.file }}
        </p>
        {% endif %}

        {% if is_text_file or not object %}
            <p>File Content (for text files):</p>
            {{ form.content }}
        {% else %}
            <p>
                <strong>This is not a text file.</strong>
                <a href="{{ object.file.url }}" download>Download</a> to edit locally.
            </p>
            <p>
                <label for="{{ form.file.id_for_label }}">Upload new version:</label>
                {{ form.file }}
            </p>
        {% endif %}
        
        <br>
        <button type="submit">Save</button>
    </form>

    {% if is_text_file or not object %}
    <script>
        // Initialize CodeMirror on our textarea
        var editor = CodeMirror.fromTextArea(document.getElementById('codemirror-editor'), {
            lineNumbers: true,
            mode: "python" // You can dynamically set this based on file extension
        });
    </script>
    {% endif %}

{% endblock %}
EOF

# --- (Optional) Create empty apps.py and tests.py ---
cat << EOF > filebagapp/apps.py
from django.apps import AppConfig

class FilebagappConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'filebagapp'
EOF

touch filebagapp/tests.py

echo ""
echo "--------------------------------------------------"
echo "✅ Done! 'filebagapp' directory is created."
echo "--------------------------------------------------"
echo ""
echo "Next steps:"
echo "1. Add 'filebagapp' to INSTALLED_APPS in your settings.py"
echo "2. Set MEDIA_ROOT and MEDIA_URL in your settings.py"
echo "3. Include 'filebagapp.urls' in your main project's urls.py"
echo "4. Run 'python manage.py makemigrations filebagapp'"
echo "5. Run 'python manage.py migrate'"
echo "6. Run 'python manage.py create_bag_group'"
echo "7. Add users to the 'bag' group in the admin"


