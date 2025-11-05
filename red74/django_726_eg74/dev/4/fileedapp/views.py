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
