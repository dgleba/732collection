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
