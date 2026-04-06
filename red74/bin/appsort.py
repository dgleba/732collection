import os
import subprocess
from collections import defaultdict

SEARCH_PATHS = [
    os.path.expanduser("~/.local/share/applications/"),
    "/usr/share/applications/",
    "/var/lib/snapd/desktop/applications/" 
]

MANUAL_MAPPING = {
    "firefox": "Internet",
    "thunderbird": "Internet",
    "firmware": "System"
}

def apply_sorted_groups():
    groups = defaultdict(list)
    all_found_apps = set()
    assigned_apps = set()

    # 1. Collect and Categorize
    for path in SEARCH_PATHS:
        if not os.path.exists(path): continue
        for filename in os.listdir(path):
            if filename.endswith(".desktop"):
                all_found_apps.add(filename)
                
                assigned = False
                for keyword, group in MANUAL_MAPPING.items():
                    if keyword in filename.lower():
                        groups[group.lower()].append(filename)
                        assigned_apps.add(filename)
                        assigned = True
                        break
                
                if not assigned:
                    try:
                        with open(os.path.join(path, filename), 'r', errors='ignore') as f:
                            for line in f:
                                if line.startswith("Categories="):
                                    cats = line.split("=")[1].strip().replace(';', ' ').split()
                                    if cats:
                                        groups[cats[0].lower()].append(filename)
                                        assigned_apps.add(filename)
                                        break
                    except:
                        pass

    # 2. Catch-all for Group 5
    remaining_apps = all_found_apps - assigned_apps
    if remaining_apps:
        groups["group5"].extend(list(remaining_apps))

    # 3. Alpha-Sort the Groups (IDs)
    # We sort the keys so the folders appear A-Z in the app grid
    sorted_folder_ids = sorted(groups.keys())
    
    # 4. Apply to GNOME
    ids_string = str(sorted_folder_ids).replace("'", '"')
    subprocess.run(["gsettings", "set", "org.gnome.desktop.app-folders", "folder-children", ids_string])

    for folder_id in sorted_folder_ids:
        apps = groups[folder_id]
        path_base = f"org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/{folder_id}/"
        
        # Alpha-Sort the Apps within the group
        sorted_apps = sorted(list(set(apps)))
        
        display_name = "Group 5" if folder_id == "group5" else folder_id.capitalize()
        
        subprocess.run(["gsettings", "set", path_base, "name", f"'{display_name}'"])
        subprocess.run(["gsettings", "set", path_base, "apps", str(sorted_apps).replace("'", '"')])
        subprocess.run(["gsettings", "set", path_base, "categories", "[]"])

    print(f"Sorted {len(sorted_folder_ids)} folders and their contents alphabetically.")

if __name__ == "__main__":
    apply_sorted_groups()

