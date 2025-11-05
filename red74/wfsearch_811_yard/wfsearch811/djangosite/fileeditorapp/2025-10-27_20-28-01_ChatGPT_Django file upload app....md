# Django file upload app...

Exported on 27/10/2025 at 20:28:01 [from ChatGPT](https://chatgpt.com/c/69000b98-ddb8-832d-beaa-7965dabf94cc) - with [SaveMyChatbot](https://save.hugocollin.com)

## User
write django app to accept multiple file uploads, list them, allow editing them.

## ChatGPT
Here’s a **simple Django app** that lets users:  
✅ upload **multiple files**,  
✅ **list** them on a page,  
✅ **edit (rename)** or **delete** them.

We’ll call the app `filemanager`.

* * *

1\. Create the app
------------------

In your project folder:

```bash
python manage.py startapp filemanager
```

Add `"filemanager"` to `INSTALLED_APPS` in `settings.py`.

* * *

2\. models.py
-------------

```python
from django.db import models

class UploadedFile(models.Model):
    file = models.FileField(upload_to='uploads/')
    name = models.CharField(max_length=255, blank=True)
    uploaded_at = models.DateTimeField(auto_now_add=True)

   def __str__(self):
        return self.name or self.file.name
```

* * *

3\. forms.py
------------

```python
from django import forms
from .models import UploadedFile

class FileUploadForm(forms.ModelForm):
    class Meta:
        model = UploadedFile
        fields = ['file']

class FileEditForm(forms.ModelForm):
    class Meta:
        model = UploadedFile
        fields = ['name']
```

* * *

4\. views.py
------------

```python
from django.shortcuts import render, redirect, get_object_or_404
from .models import UploadedFile
from .forms import FileUploadForm, FileEditForm

def file_list(request):
    files = UploadedFile.objects.all().order_by('-uploaded_at')
    return render(request, 'filemanager/file_list.html', {'files': files})

def file_upload(request):
    if request.method == 'POST':
        files = request.FILES.getlist('file')
        for f in files:
            UploadedFile.objects.create(file=f, name=f.name)
        return redirect('file_list')
    return render(request, 'filemanager/file_upload.html')

def file_edit(request, pk):
    file_obj = get_object_or_404(UploadedFile, pk=pk)
    if request.method == 'POST':
        form = FileEditForm(request.POST, instance=file_obj)
        if form.is_valid():
            form.save()
            return redirect('file_list')
    else:
        form = FileEditForm(instance=file_obj)
    return render(request, 'filemanager/file_edit.html', {'form': form, 'file_obj': file_obj})

def file_delete(request, pk):
    file_obj = get_object_or_404(UploadedFile, pk=pk)
    if request.method == 'POST':
        file_obj.delete()
        return redirect('file_list')
    return render(request, 'filemanager/file_delete.html', {'file_obj': file_obj})
```

* * *

5\. urls.py (inside `filemanager/`)
-----------------------------------

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.file_list, name='file_list'),
    path('upload/', views.file_upload, name='file_upload'),
    path('<int:pk>/edit/', views.file_edit, name='file_edit'),
    path('<int:pk>/delete/', views.file_delete, name='file_delete'),
]
```

Include it in your **project-level urls.py**:

```python
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('files/', include('filemanager.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
```

Also set in `settings.py`:

```python
MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'
```

* * *

6\. Templates
-------------

**templates/filemanager/file\_list.html**

```html
<h2>Uploaded Files</h2>
<a href="{% url 'file_upload' %}">Upload More Files</a>
<table border="1" cellpadding="5">
<tr><th>Name</th><th>File</th><th>Uploaded</th><th>Actions</th></tr>
{% for f in files %}
<tr>
  <td>{{ f.name }}</td>
  <td><a href="{{ f.file.url }}">{{ f.file.name }}</a></td>
  <td>{{ f.uploaded_at }}</td>
  <td>
    <a href="{% url 'file_edit' f.pk %}">Edit</a> |
    <a href="{% url 'file_delete' f.pk %}">Delete</a>
  </td>
</tr>
{% empty %}
<tr><td colspan="4">No files uploaded yet.</td></tr>
{% endfor %}
</table>
```

**templates/filemanager/file\_upload.html**

```html
<h2>Upload Files</h2>
<form method="post" enctype="multipart/form-data">
  {% csrf_token %}
  <input type="file" name="file" multiple>
  <button type="submit">Upload</button>
</form>
<a href="{% url 'file_list' %}">Back to list</a>
```

**templates/filemanager/file\_edit.html**

```html
<h2>Edit File Name: {{ file_obj.file.name }}</h2>
<form method="post">
  {% csrf_token %}
  {{ form.as_p }}
  <button type="submit">Save</button>
</form>
<a href="{% url 'file_list' %}">Cancel</a>
```

**templates/filemanager/file\_delete.html**

```html
<h2>Delete File: {{ file_obj.name }}</h2>
<p>Are you sure you want to delete this file?</p>
<form method="post">
  {% csrf_token %}
  <button type="submit">Confirm Delete</button>
</form>
<a href="{% url 'file_list' %}">Cancel</a>
```

* * *

7\. Migrate & run
-----------------

```bash
python manage.py makemigrations filemanager
python manage.py migrate
python manage.py runserver
```

Then go to  
👉 **[http://127.0.0.1:8000/files/](http://127.0.0.1:8000/files/)**  
to see the file list.

* * *

Would you like me to make it **HTMX-enabled** (so uploads, edits, and deletes happen inline without reloading the page)?undefined

## User
can you zip it up

## ChatGPT
Your Django app has been zipped and is ready to download:  
👉 filemanager.zip

It includes everything — models, views, forms, URLs, and templates — for uploading, listing, editing, and deleting multiple files.undefined

## User
change it to fileeditorapp

## ChatGPT
Here’s your updated Django app renamed to **`fileeditorapp`**:  
👉 fileeditorapp.zip

It supports multiple file uploads, listing, renaming, and deleting files — ready to drop into any Django project.undefined

