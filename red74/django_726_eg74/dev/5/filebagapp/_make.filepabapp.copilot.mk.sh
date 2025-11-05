#!/bin/bash

APP_NAME="filebagapp"
BASE_DIR="./$APP_NAME"
TEMPLATES_DIR="$BASE_DIR/templates/$APP_NAME"
STATIC_DIR="$BASE_DIR/static/$APP_NAME/codemirror"
UTILS_DIR="$BASE_DIR/utils"

echo "Creating Django app: $APP_NAME"

# Create directories
mkdir -p $BASE_DIR/{migrations,templates/$APP_NAME,static/$APP_NAME/codemirror,utils}
touch $BASE_DIR/__init__.py
touch $BASE_DIR/migrations/__init__.py

# Create models.py
cat > $BASE_DIR/models.py <<EOF
from django.db import models

class FileBag(models.Model):
    name = models.CharField(max_length=255, unique=True)
    file = models.FileField(upload_to='upload/')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
EOF

# Create views.py
cat > $BASE_DIR/views.py <<EOF
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from django.core.files.base import ContentFile
from .models import FileBag
from .forms import FileBagForm, CodeMirrorForm
from .utils.local_edit import edit_locally

def in_bag_group(user):
    return user.groups.filter(name='bag').exists()

def bag_required(view_func):
    return login_required(user_passes_test(in_bag_group)(view_func))

@bag_required
def file_list(request):
    files = FileBag.objects.all()
    return render(request, '$APP_NAME/list.html', {'files': files})

@bag_required
def file_upload(request):
    if request.method == 'POST':
        form = FileBagForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('filebag-list')
    else:
        form = FileBagForm()
    return render(request, '$APP_NAME/upload.html', {'form': form})

@bag_required
def file_edit(request, pk):
    filebag = get_object_or_404(FileBag, pk=pk)
    content = filebag.file.read().decode()
    if request.method == 'POST':
        form = CodeMirrorForm(request.POST)
        if form.is_valid():
            new_content = form.cleaned_data['content']
            filebag.file.save(filebag.file.name, ContentFile(new_content.encode()))
            return redirect('filebag-list')
    else:
        form = CodeMirrorForm(initial={'content': content})
    return render(request, '$APP_NAME/edit.html', {'form': form, 'filebag': filebag})

@bag_required
def file_local_edit(request, pk):
    filebag = get_object_or_404(FileBag, pk=pk)
    updated_file = edit_locally(filebag.file)
    filebag.file.save(updated_file.name, updated_file)
    return redirect('filebag-list')
EOF

# Create forms.py
cat > $BASE_DIR/forms.py <<EOF
from django import forms
from .models import FileBag

class FileBagForm(forms.ModelForm):
    class Meta:
        model = FileBag
        fields = ['name', 'file']

class CodeMirrorForm(forms.Form):
    content = forms.CharField(widget=forms.Textarea(attrs={'id': 'codemirror'}))
EOF

# Create urls.py
cat > $BASE_DIR/urls.py <<EOF
from django.urls import path
from . import views

urlpatterns = [
    path('', views.file_list, name='filebag-list'),
    path('upload/', views.file_upload, name='filebag-upload'),
    path('edit/<int:pk>/', views.file_edit, name='filebag-edit'),
    path('local-edit/<int:pk>/', views.file_local_edit, name='filebag-local-edit'),
]
EOF

# Create admin.py
cat > $BASE_DIR/admin.py <<EOF
from django.contrib import admin
from .models import FileBag

@admin.register(FileBag)
class FileBagAdmin(admin.ModelAdmin):
    list_display = ('name', 'created_at')
EOF

# Create local_edit.py
cat > $UTILS_DIR/local_edit.py <<EOF
import os
import tempfile
import subprocess
from django.core.files import File

def edit_locally(django_file):
    with tempfile.NamedTemporaryFile(delete=False, suffix='.txt') as tmp:
        tmp.write(django_file.read())
        tmp_path = tmp.name

    subprocess.call(['notepad', tmp_path])  # Windows example

    with open(tmp_path, 'rb') as f:
        updated_file = File(f, name=os.path.basename(django_file.name))
        return updated_file
EOF

# Create templates
cat > $TEMPLATES_DIR/list.html <<EOF
<h2>Files</h2>
<ul>
  {% for f in files %}
    <li>{{ f.name }} —
      <a href="{% url 'filebag-edit' f.pk %}">Edit</a> |
      <a href="{% url 'filebag-local-edit' f.pk %}">Local Edit</a>
    </li>
  {% endfor %}
</ul>
<a href="{% url 'filebag-upload' %}">Upload New</a>
EOF

cat > $TEMPLATES_DIR/upload.html <<EOF
<h2>Upload File</h2>
<form method="post" enctype="multipart/form-data">
  {% csrf_token %}
  {{ form.as_p }}
  <button type="submit">Upload</button>
</form>
EOF

cat > $TEMPLATES_DIR/edit.html <<EOF
<h2>Edit {{ filebag.name }}</h2>
<form method="post">
  {% csrf_token %}
  {{ form.as_p }}
  <button type="submit">Save</button>
</form>
<script src="{% static '$APP_NAME/codemirror/codemirror.js' %}"></script>
<script>
  var editor = CodeMirror.fromTextArea(document.getElementById("codemirror"), {
    lineNumbers: true,
    mode: "text/plain"
  });
</script>
EOF

echo "✅ $APP_NAME created successfully."
