from django.shortcuts import render, redirect, get_object_or_404
from .models import UploadedFile
from .forms import FileUploadForm, FileEditForm

def file_list(request):
    files = UploadedFile.objects.all().order_by('-uploaded_at')
    return render(request, 'fileeditorapp/file_list.html', {'files': files})

def file_upload(request):
    if request.method == 'POST':
        files = request.FILES.getlist('file')
        for f in files:
            UploadedFile.objects.create(file=f, name=f.name)
        return redirect('file_list')
    return render(request, 'fileeditorapp/file_upload.html')

def file_edit(request, pk):
    file_obj = get_object_or_404(UploadedFile, pk=pk)
    if request.method == 'POST':
        form = FileEditForm(request.POST, instance=file_obj)
        if form.is_valid():
            form.save()
            return redirect('file_list')
    else:
        form = FileEditForm(instance=file_obj)
    return render(request, 'fileeditorapp/file_edit.html', {'form': form, 'file_obj': file_obj})

def file_delete(request, pk):
    file_obj = get_object_or_404(UploadedFile, pk=pk)
    if request.method == 'POST':
        file_obj.delete()
        return redirect('file_list')
    return render(request, 'fileeditorapp/file_delete.html', {'file_obj': file_obj})
