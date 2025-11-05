#!/bin/bash
#
# Django Project Setup Script for FileEdApp
#
# This script creates the directory structure and files for the Django project
# named 'fileed_project' with the application 'fileedapp'.
#
# USAGE: 
# 1. Make the script executable: chmod +x create_app_files.sh
# 2. Run the script: ./create_app_files.sh
# 3. (After running) Initialize Django: python3 -m venv venv && source venv/bin/activate
# 4. Install dependencies: pip install -r requirements.txt
# 5. Run migrations and create superuser before starting the server.

echo "Creating project structure..."

# Create project root and app directories
mkdir -p fileed_project
mkdir -p fileed_project/templates
mkdir -p fileedapp
mkdir -p fileedapp/templates/fileedapp
mkdir -p upload # MEDIA_ROOT for files

# --- 1. Project Dependencies ---
cat > requirements.txt << 'EOF'
Django~=4.2
python-magic-bin~=0.4.14  # For robust file type detection on Windows/Linux
# Note: On Linux/Mac, you might use 'python-magic' instead.
EOF
echo "Created requirements.txt"

# --- 2. Django Management Script ---
cat > manage.py << 'EOF'
#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys

def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'fileed_project.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()
EOF
echo "Created manage.py"
chmod +x manage.py

# --- 3. Project Settings ---
cat > fileed_project/settings.py << 'EOF'
from pathlib import Path
import os

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = 'django-insecure-@e^e7v(82^8b12w^b7r2y_p-z(3n3d=9m3i+*3t98_m6v3f-m4'

DEBUG = True

ALLOWED_HOSTS = []

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'fileedapp',  # Our custom app
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'fileed_project.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'fileed_project.wsgi.application'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',},
]

LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_TZ = True

# Configuration for static files (CSS, JS, Images)
STATIC_URL = 'static/'

# Configuration for user-uploaded media (files)
MEDIA_URL = '/media/'
# IMPORTANT: Files are stored in the 'upload' folder at the project root level.
MEDIA_ROOT = BASE_DIR / 'upload' 

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Authentication configuration
LOGIN_URL = '/login/'
LOGIN_REDIRECT_URL = '/'
LOGOUT_REDIRECT_URL = '/login/'
EOF
echo "Created fileed_project/settings.py"

# --- 4. Project URL Configuration ---
cat > fileed_project/urls.py << 'EOF'
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views

urlpatterns = [
    # Built-in Auth URLs
    path('login/', auth_views.LoginView.as_view(template_name='fileedapp/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    
    # App URLs
    path('', include('fileedapp.urls')),
    path('admin/', admin.site.urls),
]

# Serve media files during development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
EOF
echo "Created fileed_project/urls.py"

# --- 5. Application __init__.py ---
cat > fileedapp/__init__.py << 'EOF'
# This file marks the 'fileedapp' directory as a Python package.
EOF
echo "Created fileedapp/__init__.py"

# --- 6. Application Models ---
cat > fileedapp/models.py << 'EOF'
from django.db import models
from django.contrib.auth.models import User

class Filer(models.Model):
    """
    Model to store file metadata and text content for editing.
    The actual file is stored in the file system (MEDIA_ROOT).
    """
    # The file is stored in a subfolder relative to MEDIA_ROOT (i.e., 'upload/...')
    file = models.FileField(upload_to='') 
    filename = models.CharField(max_length=255, unique=False) # Not truly unique due to overwrite feature, but good for display
    uploaded_at = models.DateTimeField(auto_now_add=True)
    
    # Text content of the file, only populated for files that are detected as text.
    body = models.TextField(blank=True, null=True)
    
    # Metadata
    length_kb = models.IntegerField(default=0)
    filetype = models.CharField(max_length=100, default='unknown')
    
    # Authorization
    owner = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.filename

    def get_file_url(self):
        # A utility to get the URL to the file
        return self.file.url

    class Meta:
        ordering = ['-uploaded_at'] # List in descending order by upload time
EOF
echo "Created fileedapp/models.py"

# --- 7. Application Forms ---
cat > fileedapp/forms.py << 'EOF'
from django import forms
from .models import Filer

class FileUploadForm(forms.ModelForm):
    """Form to handle file uploads."""
    class Meta:
        model = Filer
        fields = ('file',)
        # Note: 'filename', 'owner', 'body', etc. are handled in the view.

class ExternalFileReuploadForm(forms.Form):
    """Form used to re-upload a file after external editing."""
    file = forms.FileField()
EOF
echo "Created fileedapp/forms.py"

# --- 8. Application URLs ---
cat > fileedapp/urls.py << 'EOF'
from django.urls import path
from . import views

urlpatterns = [
    # Home/List View
    path('', views.FileListView.as_view(), name='file_list'),
    
    # Upload/Create View
    path('upload/', views.FileUpdateCreateView.as_view(), name='file_upload'),
    
    # Edit/Update Views (Internal Codemirror Editor)
    path('edit/<int:pk>/', views.FileEditView.as_view(), name='file_edit'),
    path('edit/save/<int:pk>/', views.FileSaveBodyView.as_view(), name='file_save_body'),
    
    # External Edit Workflow (Download and Re-upload)
    path('download/<int:pk>/', views.FileDownloadView.as_view(), name='file_download'),
    path('reupload/<int:pk>/', views.FileReuploadView.as_view(), name='file_reupload'),
]
EOF
echo "Created fileedapp/urls.py"

# --- 9. Application Views ---
cat > fileedapp/views.py << 'EOF'
import os
import mimetypes
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy, reverse
from django.views.generic import ListView, View, UpdateView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, FileResponse, Http404, HttpResponse
from django.conf import settings
from .models import Filer
from .forms import FileUploadForm, ExternalFileReuploadForm
import magic
from django.contrib import messages

# --- Utility Functions ---

def is_text_file(uploaded_file):
    """Checks if a file is likely text content suitable for Codemirror."""
    # Use python-magic for better mime type detection
    try:
        # Read the first 1024 bytes to determine mime type
        uploaded_file.seek(0)
        mime = magic.Magic(mime=True)
        file_mime = mime.from_buffer(uploaded_file.read(1024))
        uploaded_file.seek(0) # Reset pointer
        
        # Check for common text types (text/*) or empty files
        return file_mime.startswith('text/') or 'empty' in file_mime
    except Exception:
        # Fallback to simple check
        uploaded_file.seek(0)
        mime_type, _ = mimetypes.guess_type(uploaded_file.name)
        if mime_type:
            return mime_type.startswith('text/')
        return False


def handle_file_processing(file_object, user, overwrite_pk=None):
    """Handles file saving, content extraction, and metadata creation/update."""
    
    file_name = file_object.name
    file_size_bytes = file_object.size
    
    # 1. Check for overwrite (if called from upload view)
    if overwrite_pk:
        filer_instance = get_object_or_404(Filer, pk=overwrite_pk)
        
        # Delete old file from filesystem first
        if os.path.exists(filer_instance.file.path):
            os.remove(filer_instance.file.path)
            
        # Update the existing instance's file field. Django will save the new file.
        filer_instance.file = file_object
        
    else:
        # Create a new instance
        filer_instance = Filer(filename=file_name, owner=user, file=file_object)
        
    
    # 2. Extract metadata and content
    filer_instance.length_kb = round(file_size_bytes / 1024)
    
    # Determine MIME type for storage (needs to read the file again after file field is set)
    # Since file_object is already pointing to the new file, we can process it.
    mime = magic.Magic(mime=True)
    file_object.seek(0) # Ensure we read from the start
    filer_instance.filetype = mime.from_buffer(file_object.read(1024))
    file_object.seek(0) # Reset pointer for file field save
    
    if is_text_file(file_object):
        # Read full text content into the database body field
        try:
            file_object.seek(0)
            # Read all content using 'rb' for robustness before decoding
            content = file_object.read()
            filer_instance.body = content.decode('utf-8')
        except UnicodeDecodeError:
            filer_instance.body = None # Set to None if decoding fails, indicating non-editable
            messages.warning(user, f"File '{file_name}' was uploaded but text content could not be decoded for editing.")
        except Exception as e:
            filer_instance.body = None
            messages.error(user, f"Error processing file '{file_name}': {e}")
    else:
        filer_instance.body = None # Explicitly set to None for non-text files

    # Save the Filer instance (this saves the FileField to disk)
    filer_instance.save()
    return filer_instance

# --- Mixins and Permissions ---

class FileAccessMixin(LoginRequiredMixin, UserPassesTestMixin):
    """Ensures user is logged in and belongs to the 'fileed' group."""
    login_url = reverse_lazy('login')
    
    def test_func(self):
        # User must be authenticated and belong to the 'fileed' group
        return self.request.user.groups.filter(name='fileed').exists()

# --- Views ---

class FileListView(FileAccessMixin, ListView):
    """Lists all files uploaded by the current user."""
    model = Filer
    template_name = 'fileedapp/list.html'
    context_object_name = 'files'

    def get_queryset(self):
        # Show files in descending upload order, filtered by owner
        return Filer.objects.filter(owner=self.request.user).order_by('-uploaded_at')


class FileUpdateCreateView(FileAccessMixin, View):
    """Handles multiple file uploads and file name conflict resolution."""
    template_name = 'fileedapp/upload.html'
    
    def get(self, request):
        form = FileUploadForm()
        return render(request, self.template_name, {'form': form})
        
    def post(self, request, *args, **kwargs):
        uploaded_files = request.FILES.getlist('file')
        
        # Check if this is an overwrite request from the JS dialog
        overwrite_pk = request.POST.get('overwrite_pk')
        
        if overwrite_pk:
            # This is the second POST request to confirm overwrite
            uploaded_file = uploaded_files[0]
            try:
                # Process the overwrite
                filer = handle_file_processing(uploaded_file, request.user, overwrite_pk=overwrite_pk)
                messages.success(request, f"File '{filer.filename}' was successfully overwritten.")
                return JsonResponse({'status': 'success', 'redirect_url': reverse('file_list')})
            except Exception as e:
                return JsonResponse({'status': 'error', 'message': f'Overwrite failed: {str(e)}'}, status=500)

        # For the initial upload, we only process the first file if multiple were selected
        # because the conflict detection flow only supports checking one file name at a time
        # for simplicity.
        if not uploaded_files:
            return JsonResponse({'status': 'error', 'message': 'No file uploaded.'}, status=400)
            
        uploaded_file = uploaded_files[0]
        
        existing_file = Filer.objects.filter(filename=uploaded_file.name, owner=request.user).first()

        if existing_file:
            # File conflict detected (first POST request)
            return JsonResponse({
                'status': 'conflict',
                'filename': uploaded_file.name,
                'pk': existing_file.pk,
            })
        else:
            # No conflict, save the new file
            try:
                filer = handle_file_processing(uploaded_file, request.user)
                messages.success(request, f"File '{filer.filename}' successfully uploaded.")
                return JsonResponse({'status': 'success', 'redirect_url': reverse('file_list')})
            except Exception as e:
                messages.error(request, f"Upload failed for '{uploaded_file.name}': {str(e)}")
                return JsonResponse({'status': 'error', 'message': f'Upload failed: {str(e)}'}, status=500)


class FileEditView(FileAccessMixin, UpdateView):
    """Renders the Codemirror editor for a text file."""
    model = Filer
    fields = ['body'] # We only update the body field via this view's post
    template_name = 'fileedapp/edit.html'
    context_object_name = 'filer'
    
    def get_queryset(self):
        # Ensure user can only edit their own files
        return Filer.objects.filter(owner=self.request.user)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        filer = context['filer']
        if filer.body is None:
            # If body is None (e.g., binary file or decode error), redirect back or show error
            messages.error(self.request, f"File '{filer.filename}' is not a valid text file and cannot be edited in the browser.")
            # Use redirect logic outside of get_context_data if needed, but for now, show error
            pass
            
        context['is_text_file'] = bool(filer.body is not None)
        return context


class FileSaveBodyView(FileAccessMixin, View):
    """AJAX endpoint to save the content from the Codemirror editor."""
    def post(self, request, pk):
        filer = get_object_or_404(Filer, pk=pk, owner=request.user)
        new_body = request.POST.get('body', '')
        
        if filer.body is None:
            return JsonResponse({'status': 'error', 'message': 'File is not editable (non-text or decoding error).'}, status=400)
            
        try:
            # 1. Update the body in the database
            filer.body = new_body
            filer.save(update_fields=['body'])

            # 2. Update the actual file on the filesystem
            file_path = filer.file.path
            
            # The 'w' mode truncates the file and writes the new content.
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_body)
                
            # 3. Update length_kb metadata
            filer.length_kb = round(os.path.getsize(file_path) / 1024)
            filer.save(update_fields=['length_kb'])

            return JsonResponse({'status': 'success', 'message': 'File content saved and updated on disk.'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': f'Failed to save file: {e}'}, status=500)


class FileDownloadView(FileAccessMixin, View):
    """Serves the file with Content-Disposition: attachment for external editing."""
    def get(self, request, pk):
        filer = get_object_or_404(Filer, pk=pk, owner=request.user)
        try:
            # Use filer.file to get the File object and open() to get the handle
            response = FileResponse(filer.file.open('rb'), as_attachment=True, filename=filer.filename)
            response['Content-Type'] = filer.filetype
            # The Content-Disposition header is crucial for download
            response['Content-Disposition'] = f'attachment; filename="{filer.filename}"' 
            return response
        except FileNotFoundError:
            raise Http404(f"File not found on disk: {filer.filename}")


class FileReuploadView(FileAccessMixin, View):
    """Handles the re-upload of a file after external editing."""
    def post(self, request, pk):
        # We need the Filer instance to ensure it exists and belongs to the user
        get_object_or_404(Filer, pk=pk, owner=request.user) 
        
        form = ExternalFileReuploadForm(request.POST, request.FILES)
        
        if form.is_valid():
            uploaded_file = request.FILES.get('file')
            
            if not uploaded_file:
                 return JsonResponse({'status': 'error', 'message': 'No file was provided.'}, status=400)
                 
            try:
                # Update the file using the utility function, using pk to signal overwrite
                filer = handle_file_processing(uploaded_file, request.user, overwrite_pk=pk)
                messages.success(request, f"File '{filer.filename}' successfully re-uploaded and updated.")
                return JsonResponse({'status': 'success', 'redirect_url': reverse('file_list')})
            except Exception as e:
                return JsonResponse({'status': 'error', 'message': f'Re-upload failed: {str(e)}'}, status=500)
        
        # Form validation failed
        error_message = ', '.join([f"{k}: {v[0]}" for k, v in form.errors.items()])
        return JsonResponse({'status': 'error', 'message': f'Re-upload form validation failed: {error_message}'}, status=400)
EOF
echo "Created fileedapp/views.py"

# --- 10. Template: base.html ---
cat > fileedapp/templates/fileedapp/base.html << 'EOF'
{% load static %}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% block title %}File Editor App{% endblock %}</title>
    <!-- Tailwind CSS CDN for styling -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Inter Font -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
        body { font-family: 'Inter', sans-serif; }
    </style>
    {% block extra_head %}{% endblock %}
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">
    <!-- Navigation -->
    <nav class="bg-indigo-600 p-4 shadow-lg">
        <div class="container mx-auto flex justify-between items-center">
            <a href="{% url 'file_list' %}" class="text-white text-2xl font-bold rounded-lg p-2 hover:bg-indigo-700 transition">FileEdApp</a>
            <div>
                {% if user.is_authenticated %}
                    <span class="text-white mr-4">Welcome, {{ user.username }} ({% for group in user.groups.all %}{{ group.name }}{% if not forloop.last %}, {% endif %}{% endfor %})</span>
                    <a href="{% url 'logout' %}" class="text-white hover:bg-indigo-700 py-2 px-4 rounded-lg transition border border-white">Logout</a>
                {% else %}
                    <a href="{% url 'login' %}" class="text-white hover:bg-indigo-700 py-2 px-4 rounded-lg transition border border-white">Login</a>
                {% endif %}
            </div>
        </div>
    </nav>

    <!-- Main Content and Messages -->
    <main class="container mx-auto p-4 flex-grow">
        {% if messages %}
            <div class="space-y-3 mb-6">
                {% for message in messages %}
                    <div class="p-4 rounded-lg text-white font-medium 
                        {% if message.tags == 'error' %}bg-red-500{% endif %}
                        {% if message.tags == 'success' %}bg-green-500{% endif %}
                        {% if message.tags == 'warning' %}bg-yellow-500{% endif %}
                        {% if message.tags == 'info' or message.tags == '' %}bg-blue-500{% endif %}" role="alert">
                        {{ message }}
                    </div>
                {% endfor %}
            </div>
        {% endif %}

        {% block content %}{% endblock %}
    </main>
    
    <footer class="p-4 bg-gray-200 text-center text-gray-600 mt-auto">
        &copy; 2025 File Editor App. User ID: {{ user.pk|default:'N/A' }}
    </footer>
</body>
</html>
EOF
echo "Created fileedapp/templates/fileedapp/base.html"

# --- 11. Template: login.html ---
cat > fileedapp/templates/fileedapp/login.html << 'EOF'
{% extends "fileedapp/base.html" %}

{% block title %}Login - File Editor App{% endblock %}

{% block content %}
<div class="max-w-md mx-auto bg-white p-8 rounded-xl shadow-2xl mt-10">
    <h1 class="text-3xl font-bold text-center text-indigo-700 mb-6">User Login</h1>
    <p class="text-center text-gray-600 mb-6">You must be logged in and part of the 'fileed' group to access this application.</p>
    
    <form method="post" class="space-y-5">
        {% csrf_token %}
        <div class="space-y-2">
            <label for="id_username" class="block text-sm font-medium text-gray-700">Username</label>
            <input type="text" name="username" id="id_username" required 
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-indigo-500 focus:border-indigo-500 shadow-sm"
                   autocomplete="username">
        </div>
        <div class="space-y-2">
            <label for="id_password" class="block text-sm font-medium text-gray-700">Password</label>
            <input type="password" name="password" id="id_password" required 
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-indigo-500 focus:border-indigo-500 shadow-sm"
                   autocomplete="current-password">
        </div>
        
        {% if form.errors %}
            <div class="p-3 bg-red-100 border-l-4 border-red-500 text-red-700 rounded-lg">
                <p>Your username and password didn't match. Please try again.</p>
            </div>
        {% endif %}
        
        <button type="submit" 
                class="w-full py-3 px-4 bg-indigo-600 text-white font-semibold rounded-lg hover:bg-indigo-700 transition duration-150 shadow-md">
            Log In
        </button>
        <input type="hidden" name="next" value="{{ next }}">
    </form>
</div>
{% endblock content %}
EOF
echo "Created fileedapp/templates/fileedapp/login.html"

# --- 12. Template: upload.html ---
cat > fileedapp/templates/fileedapp/upload.html << 'EOF'
{% extends "fileedapp/base.html" %}

{% block title %}Upload Files{% endblock %}

{% block content %}
<div class="max-w-4xl mx-auto bg-white p-8 rounded-xl shadow-2xl">
    <h1 class="text-3xl font-bold text-center text-indigo-700 mb-6">Upload Files to /upload</h1>

    <!-- Upload Form -->
    <form id="uploadForm" method="post" enctype="multipart/form-data" class="space-y-6">
        {% csrf_token %}
        <div>
            <label for="id_file" class="block text-lg font-medium text-gray-700 mb-2">Select a file (Only the first selected file will be processed):</label>
            <input type="file" name="file" id="id_file" required 
                   class="w-full text-sm text-gray-500
                   file:mr-4 file:py-2 file:px-4
                   file:rounded-full file:border-0
                   file:text-sm file:font-semibold
                   file:bg-indigo-50 file:text-indigo-700
                   hover:file:bg-indigo-100">
        </div>
        <input type="hidden" name="overwrite_pk" id="overwrite_pk">

        <button type="submit" id="submitButton"
                class="w-full py-3 px-4 bg-green-600 text-white font-semibold rounded-lg hover:bg-green-700 transition duration-150 shadow-md">
            Upload File
        </button>
    </form>
</div>

<!-- Modal Dialog for Overwrite Confirmation -->
<div id="overwriteModal" class="hidden fixed inset-0 bg-gray-800 bg-opacity-75 z-50 flex items-center justify-center transition-opacity duration-300">
    <div class="bg-white rounded-xl p-6 w-full max-w-sm shadow-2xl transform scale-100 transition-transform duration-300">
        <h2 class="text-xl font-bold text-red-600 mb-4">File Conflict Detected</h2>
        <p class="mb-4 text-gray-700">The file <strong id="conflictFileName" class="text-indigo-600"></strong> has been uploaded before.</p>
        <p class="mb-6 text-gray-700">Do you want to overwrite the existing file?</p>
        <div class="flex justify-end space-x-3">
            <button id="cancelOverwrite" type="button" class="py-2 px-4 bg-gray-300 text-gray-800 rounded-lg hover:bg-gray-400 transition">Cancel</button>
            <button id="confirmOverwrite" type="button" class="py-2 px-4 bg-red-600 text-white rounded-lg hover:bg-red-700 transition">Overwrite</button>
        </div>
    </div>
</div>

<script>
    document.getElementById('uploadForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        const fileInput = document.getElementById('id_file');
        const file = fileInput.files[0];

        if (!file) return;

        const formData = new FormData();
        formData.append('file', file);
        formData.append('csrfmiddlewaretoken', document.querySelector('input[name="csrfmiddlewaretoken"]').value);
        const overwritePkInput = document.getElementById('overwrite_pk');
        
        // If overwrite_pk is set, this is the second submission (confirmation)
        if (overwritePkInput.value) {
            formData.append('overwrite_pk', overwritePkInput.value);
            submitForm(formData);
            return;
        }

        // First submission check for conflict
        document.getElementById('submitButton').disabled = true;

        fetch("{% url 'file_upload' %}", {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest' // Identify as AJAX request
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'conflict') {
                // Show modal dialog
                document.getElementById('conflictFileName').textContent = data.filename;
                document.getElementById('overwrite_pk').value = data.pk;
                document.getElementById('overwriteModal').classList.remove('hidden');
                
                // Keep submit button disabled until dialog is resolved
                
                // Set up event listeners for modal buttons
                document.getElementById('cancelOverwrite').onclick = function() {
                    document.getElementById('overwriteModal').classList.add('hidden');
                    document.getElementById('overwrite_pk').value = '';
                    document.getElementById('submitButton').disabled = false;
                    // Important: Clear the file input so the user must select it again 
                    // if they decide not to overwrite.
                    fileInput.value = null; 
                };

                document.getElementById('confirmOverwrite').onclick = function() {
                    document.getElementById('overwriteModal').classList.add('hidden');
                    // Re-submit the form (which will hit the overwrite logic in POST)
                    const confirmFormData = new FormData();
                    confirmFormData.append('file', file); // Append the actual file again
                    confirmFormData.append('csrfmiddlewaretoken', document.querySelector('input[name="csrfmiddlewaretoken"]').value);
                    confirmFormData.append('overwrite_pk', data.pk);
                    submitForm(confirmFormData);
                };

            } else if (data.status === 'success') {
                window.location.href = data.redirect_url;
            } else {
                console.error(data.message);
                alert('Upload Error: ' + data.message);
                document.getElementById('submitButton').disabled = false;
            }
        })
        .catch(error => {
            console.error('Network or system error:', error);
            alert('A network error occurred during upload check.');
            document.getElementById('submitButton').disabled = false;
        });
    });
    
    function submitForm(formData) {
        // Send the final/confirmed submission
        fetch("{% url 'file_upload' %}", {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                window.location.href = data.redirect_url;
            } else {
                console.error(data.message);
                alert('Upload Error: ' + data.message);
            }
            document.getElementById('submitButton').disabled = false;
        })
        .catch(error => {
            console.error('Network or system error:', error);
            alert('A network error occurred during final submission.');
            document.getElementById('submitButton').disabled = false;
        });
    }
</script>
EOF
echo "Created fileedapp/templates/fileedapp/upload.html"

# --- 13. Template: list.html ---
cat > fileedapp/templates/fileedapp/list.html << 'EOF'
{% extends "fileedapp/base.html" %}

{% block title %}Your Uploaded Files{% endblock %}

{% block content %}
<div class="flex justify-between items-center mb-6">
    <h1 class="text-3xl font-bold text-gray-800">Your Files (Uploaded Descending)</h1>
    <a href="{% url 'file_upload' %}" 
       class="py-2 px-4 bg-indigo-600 text-white font-semibold rounded-lg hover:bg-indigo-700 transition duration-150 shadow-lg">
        + New Upload
    </a>
</div>

<div class="bg-white rounded-xl shadow-2xl overflow-hidden">
    <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
            <tr>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">File Name</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Type</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Size (KB)</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Uploaded At</th>
                <th scope="col" class="relative px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            {% for file in files %}
            <tr class="hover:bg-gray-50 transition duration-150" data-pk="{{ file.pk }}">
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ file.filename }}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ file.filetype }}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ file.length_kb }}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ file.uploaded_at|date:"Y-m-d H:i" }}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-center space-x-3">
                    {% if file.body is not None %}
                        <a href="{% url 'file_edit' file.pk %}" 
                           class="text-indigo-600 hover:text-indigo-900 font-medium p-2 rounded-lg hover:bg-indigo-50 transition">
                            In-Browser Edit
                        </a>
                    {% else %}
                        <span class="text-gray-400 font-medium p-2">Not Text</span>
                    {% endif %}
                    
                    <!-- External Edit / Download Link -->
                    <button onclick="startExternalEdit('{% url 'file_download' file.pk %}', '{{ file.filename }}', '{% url 'file_reupload' file.pk %}')"
                            class="text-green-600 hover:text-green-900 font-medium p-2 rounded-lg hover:bg-green-50 transition">
                        External Edit/Download
                    </button>
                </td>
            </tr>
            {% empty %}
            <tr>
                <td colspan="5" class="px-6 py-4 text-center text-gray-500">
                    You have not uploaded any files yet.
                </td>
            </tr>
            {% endfor %}
        </tbody>
    </table>
</div>

<!-- Re-Upload Modal Dialog for External Edit -->
<div id="reuploadModal" class="hidden fixed inset-0 bg-gray-800 bg-opacity-75 z-50 flex items-center justify-center transition-opacity duration-300">
    <div class="bg-white rounded-xl p-6 w-full max-w-lg shadow-2xl transform scale-100 transition-transform duration-300">
        <h2 class="text-2xl font-bold text-indigo-700 mb-4">Re-Upload Edited File</h2>
        <p class="mb-4 text-gray-700">
            1. The file was downloaded to your local machine: <strong id="downloadedFileName"></strong>.
        </p>
        <p class="mb-6 text-gray-700">
            2. After saving your edits in your local text editor, please select and re-upload the **same file** below to update the version on the server.
        </p>

        <form id="reuploadForm" method="post" enctype="multipart/form-data" class="space-y-4">
            {% csrf_token %}
            <input type="file" name="file" id="reupload_file" required 
                   class="w-full text-sm text-gray-500
                   file:mr-4 file:py-2 file:px-4
                   file:rounded-full file:border-0
                   file:text-sm file:font-semibold
                   file:bg-indigo-50 file:text-indigo-700
                   hover:file:bg-indigo-100">

            <div class="flex justify-end space-x-3 pt-4">
                <button type="button" onclick="document.getElementById('reuploadModal').classList.add('hidden')"
                        class="py-2 px-4 bg-gray-300 text-gray-800 rounded-lg hover:bg-gray-400 transition">Close</button>
                <button type="submit" id="reuploadSubmit"
                        class="py-2 px-4 bg-green-600 text-white rounded-lg hover:bg-green-700 transition disabled:opacity-50" disabled>
                    Complete Re-Upload
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    function startExternalEdit(downloadUrl, filename, reuploadUrl) {
        // 1. Download the file (initiates browser download)
        window.location.href = downloadUrl;
        
        // 2. Show the re-upload dialog immediately
        document.getElementById('downloadedFileName').textContent = filename;
        const modal = document.getElementById('reuploadModal');
        modal.classList.remove('hidden');
        
        // 3. Set up the re-upload form action and logic
        const form = document.getElementById('reuploadForm');
        form.action = reuploadUrl;
        
        const reuploadFile = document.getElementById('reupload_file');
        const reuploadSubmit = document.getElementById('reuploadSubmit');

        // Enable button only when a file is selected
        reuploadFile.onchange = function() {
            reuploadSubmit.disabled = !reuploadFile.files.length;
        };
        
        form.onsubmit = function(e) {
            e.preventDefault();
            reuploadSubmit.disabled = true;
            reuploadSubmit.textContent = 'Uploading...';
            
            const formData = new FormData(form);
            
            fetch(reuploadUrl, {
                method: 'POST',
                body: formData,
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    // Redirect to list view to show success message
                    window.location.href = data.redirect_url;
                } else {
                    alert('Re-upload failed: ' + data.message);
                    reuploadSubmit.textContent = 'Complete Re-Upload';
                    reuploadSubmit.disabled = false;
                }
            })
            .catch(error => {
                console.error('Re-upload network error:', error);
                alert('A network error occurred during re-upload.');
                reuploadSubmit.textContent = 'Complete Re-Upload';
                reuploadSubmit.disabled = false;
            });
        };
    }
</script>
EOF
echo "Created fileedapp/templates/fileedapp/list.html"

# --- 14. Template: edit.html ---
cat > fileedapp/templates/fileedapp/edit.html << 'EOF'
{% extends "fileedapp/base.html" %}

{% block title %}Edit: {{ filer.filename }}{% endblock %}

{% block extra_head %}
    <!-- CodeMirror Assets (CDN) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/codemirror.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/codemirror.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/mode/xml/xml.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/mode/css/css.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/mode/javascript/javascript.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/mode/python/python.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/mode/markdown/markdown.min.js"></script>
    <style>
        .CodeMirror {
            border: 1px solid #ddd;
            height: 70vh; /* Set a fixed height for the editor area */
            border-radius: 0.75rem; /* rounded-xl */
            font-size: 14px;
        }
        .CodeMirror-vscrollbar {
            border-radius: 0 0.75rem 0.75rem 0; /* Match rounded-xl corners */
        }
    </style>
{% endblock %}

{% block content %}
<div class="max-w-6xl mx-auto">
    <h1 class="text-3xl font-bold text-gray-800 mb-4">Editing: <span class="text-indigo-600">{{ filer.filename }}</span></h1>
    <p class="text-sm text-gray-500 mb-6">File Type: {{ filer.filetype }} | Current Size: {{ filer.length_kb }} KB</p>

    {% if filer.body is None %}
        <div class="p-4 bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 rounded-lg">
            <p class="font-bold">Cannot Edit In-Browser</p>
            <p>This file is either not a text file or its content could not be decoded. Please use the "External Edit/Download" feature from the file list.</p>
        </div>
    {% else %}
        <!-- The Textarea that Codemirror attaches to -->
        <textarea id="code" name="body" class="hidden">{{ filer.body }}</textarea>

        <div class="flex justify-end space-x-4 mb-4">
            <button id="saveButton" 
                    class="py-3 px-6 bg-green-600 text-white font-semibold rounded-lg hover:bg-green-700 transition duration-150 shadow-md disabled:bg-green-400">
                Save Changes (Ctrl+S / Cmd+S)
            </button>
            <a href="{% url 'file_list' %}" 
            class="py-3 px-6 bg-gray-500 text-white font-semibold rounded-lg hover:bg-gray-600 transition duration-150 shadow-md flex items-center">
                Back to List
            </a>
        </div>

        <!-- Message area for save status -->
        <div id="statusMessage" class="hidden p-3 rounded-lg font-medium text-center"></div>
    {% endif %}
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Only initialize CodeMirror if the body is editable
        if ("{{ filer.body|default:'null' }}" !== 'null') {
            const textarea = document.getElementById('code');
            const saveButton = document.getElementById('saveButton');
            const statusMessage = document.getElementById('statusMessage');

            // Determine the mode based on file type (a simplified mapping)
            let mode = 'text/plain';
            const filetype = "{{ filer.filetype }}";
            if (filetype.includes('html') || filetype.includes('xml')) {
                mode = 'text/html';
            } else if (filetype.includes('css')) {
                mode = 'text/css';
            } else if (filetype.includes('javascript') || filetype.includes('json')) {
                mode = 'text/javascript';
            } else if (filetype.includes('python')) {
                mode = 'text/x-python';
            } else if (filetype.includes('markdown')) {
                mode = 'text/x-markdown';
            } else if (filetype.includes('text/')) {
                mode = 'text/plain';
            }

            // Initialize CodeMirror
            const editor = CodeMirror.fromTextArea(textarea, {
                lineNumbers: true,
                mode: mode,
                indentUnit: 4,
                theme: 'default', // You can load more themes
                autofocus: true,
                lineWrapping: true
            });

            // Track changes to enable/disable the save button
            editor.on('change', function() {
                saveButton.disabled = false;
                statusMessage.classList.add('hidden');
            });

            // Function to display status messages
            function displayStatus(message, isSuccess) {
                statusMessage.textContent = message;
                statusMessage.classList.remove('hidden', 'bg-red-100', 'bg-green-100', 'text-red-700', 'text-green-700');
                if (isSuccess) {
                    statusMessage.classList.add('bg-green-100', 'text-green-700');
                } else {
                    statusMessage.classList.add('bg-red-100', 'text-red-700');
                }
            }
            
            // Save logic
            async function saveContent() {
                saveButton.disabled = true;
                saveButton.textContent = 'Saving...';
                
                const newContent = editor.getValue();
                const url = "{% url 'file_save_body' filer.pk %}";
                
                const formData = new URLSearchParams();
                formData.append('body', newContent);
                formData.append('csrfmiddlewaretoken', '{{ csrf_token }}');
                
                try {
                    const response = await fetch(url, {
                        method: 'POST',
                        body: formData,
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'Content-Type': 'application/x-www-form-urlencoded'
                        }
                    });

                    const data = await response.json();

                    if (response.ok && data.status === 'success') {
                        displayStatus(data.message, true);
                    } else {
                        displayStatus('Save failed: ' + data.message, false);
                    }

                } catch (error) {
                    console.error('Save failed due to network or system error:', error);
                    displayStatus('An unexpected error occurred during save.', false);
                } finally {
                    saveButton.textContent = 'Save Changes (Ctrl+S / Cmd+S)';
                }
            }

            saveButton.addEventListener('click', saveContent);

            // Bind Ctrl+S / Cmd+S for quick save
            editor.addKeyMap({
                "Cmd-S": function(cm) { saveContent(); },
                "Ctrl-S": function(cm) { saveContent(); }
            });
            
            // Disable initially if no changes have been made
            saveButton.disabled = true;
        }
    });
</script>
{% endblock %}
EOF
echo "Created fileedapp/templates/fileedapp/edit.html"

# --- Project Cleanup and Success Message ---
echo ""
echo "#########################################################"
echo "Project files successfully generated in the current directory."
echo "Directory Structure:"
echo "  .
  ├── create_app_files.sh
  ├── fileed_project/
  │   ├── settings.py
  │   ├── urls.py
  │   └── templates/
  │       └── fileedapp/ (Contains all HTML templates)
  ├── fileedapp/
  │   ├── __init__.py
  │   ├── models.py
  │   ├── forms.py
  │   ├── urls.py
  │   └── views.py
  ├── manage.py
  ├── requirements.txt
  └── upload/ (Media Root)
"
echo "Next Steps:"
echo "1. Activate a Python environment."
echo "2. Install dependencies: pip install -r requirements.txt"
echo "3. Run migrations: python manage.py makemigrations fileedapp && python manage.py migrate"
echo "4. Create superuser: python manage.py createsuperuser"
echo "5. Log in to Django Admin and create a Group named 'fileed'. Add your user to this group."
echo "6. Run the server: python manage.py runserver"
echo "#########################################################"
