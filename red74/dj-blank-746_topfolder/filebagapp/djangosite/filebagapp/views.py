from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from django.core.files.base import ContentFile
from .models import FileBag
from .forms import FileBagForm, CodeMirrorForm
from .utils.local_edit import edit_locally
from django.contrib.admin.views.decorators import staff_member_required

def in_bag_group(user):
    return user.groups.filter(name='bag').exists()

# def bag_required(view_func):
    # return login_required(user_passes_test(in_bag_group)(view_func))

def bag_required(view_func):
    return staff_member_required(view_func)

@bag_required
def file_list(request):
    files = FileBag.objects.all()
    return render(request, 'filebagapp/list.html', {'files': files})

@bag_required
def file_upload(request):
    if request.method == 'POST':
        form = FileBagForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('filebag-list')
    else:
        form = FileBagForm()
    return render(request, 'filebagapp/upload.html', {'form': form})

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
    return render(request, 'filebagapp/edit.html', {'form': form, 'filebag': filebag})

@bag_required
def file_local_edit(request, pk):
    filebag = get_object_or_404(FileBag, pk=pk)
    updated_file = edit_locally(filebag.file)
    filebag.file.save(updated_file.name, updated_file)
    return redirect('filebag-list')
