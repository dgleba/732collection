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
