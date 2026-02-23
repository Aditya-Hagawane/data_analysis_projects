import os 

base_dir = "store_analysis"

folders = [
    "data/raw_store",
    "data/cleaned_store",
    "notebooks",
    "scripts",
    "dashboard",
    "outputs"
    ]

for folder in folders:
    path = os.path.join(base_dir, folder)
    os.makedirs(path, exist_ok = True)
    
print(f"Project structure for {base_dir} created successfully.")