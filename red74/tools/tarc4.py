import os
import socket
import tarfile
from datetime import datetime
from pathlib import Path

def create_archive():
    # 1. Environment & Path Setup
    cwd = Path.cwd()
    current_folder_name = cwd.name
    hostname = socket.gethostname()
    
    # Replicating ${PWD////_} (replacing / with _)
    # We strip the leading separator to avoid a leading underscore
    fnpath = str(cwd).replace(os.sep, '_').lstrip('_')
    
    # 2. Filename Generation
    timestamp = datetime.now().strftime("%Y-%m-%d_%H.%M.%S")
    output_filename = f"{hostname}_{fnpath}_{timestamp}.tgz"
    output_path = cwd / output_filename

    print(f"Target: {output_filename}")

    # 3. Exclusion Rules
    exclude_ext = {'.tar.gz', '.tgz', '.zip'}
    exclude_patterns = [
        "sysdata/", "tmp/", "zip/", "x/", "log/", "logs/",
        "djangosite/static/", "datasys/", "node_modules/", "_pic/",
        "upload/images/", "stacks/data/", "argostat/data/", "etldb/",
        "file/tsf/", "data/crib/", "datatest/", "logoutput/",
        "db/uploads/", "nc/uploads/", "djangosite/upload/", "test/"
    ]

    def is_excluded(path_obj):
        """Returns True if the path matches any exclusion criteria."""
        path_str = path_obj.as_posix()
        
        # Check if any part of the path matches our exclusion list
        if any(pattern in path_str for pattern in exclude_patterns):
            return True
        
        # Check file extensions (for files only)
        if path_obj.is_file() and path_obj.suffix in exclude_ext:
            return True
            
        # Don't archive the output file itself
        if path_obj.name == output_filename:
            return True
            
        return False

    # 4. Archiving Process
    # Move to the parent directory so 'tar' includes the folder name in the paths
    os.chdir(cwd.parent)

    try:
        with tarfile.open(output_path, "w:gz") as tar:
            print(f"Walking through {current_folder_name}...")
            
            for root, dirs, files in os.walk(current_folder_name):
                root_path = Path(root)

                # Filter directories in-place to prevent os.walk from entering excluded folders
                # This makes the script much faster on large node_modules or data folders
                dirs[:] = [d for d in dirs if not is_excluded(root_path / d)]

                # Add the folder structure (including empty folders)
                for d in dirs:
                    dir_to_add = root_path / d
                    tar.add(dir_to_add, recursive=False)

                # Add the files
                for f in files:
                    file_to_add = root_path / f
                    if not is_excluded(file_to_add):
                        tar.add(file_to_add, recursive=False)
                        print(f"  + Added: {file_to_add}")

        print(f"\nSuccessfully archived to: {output_path}")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    create_archive()
    