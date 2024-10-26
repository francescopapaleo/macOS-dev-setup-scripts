#!/usr/bin/env python3

import subprocess
from pathlib import Path

def run_installer(pkg_path):
    """Run the installer for a .pkg file."""
    print(f"Installing {pkg_path.name}...")
    subprocess.run(["sudo", "installer", "-pkg", str(pkg_path), "-target", "/"], check=True)

def list_and_install_pkgs(base_path):
    """Recursively find and install all .pkg files in the given path."""
    pkg_files = list(Path(base_path).rglob("*.pkg"))  # Recursively find all .pkg files
    if not pkg_files:
        print(f"No .pkg files found in {base_path}.")
        return

    print(f"Found {len(pkg_files)} .pkg files in {base_path}.")
    for pkg_path in pkg_files:
        run_installer(pkg_path)

def main():
    base_path = input("Enter the path to search for .pkg files: ").strip()
    path_obj = Path(base_path)

    if not path_obj.is_dir():
        print(f"The path '{base_path}' is not a valid directory.")
        return

    list_and_install_pkgs(base_path)
    print("All installations complete!")

if __name__ == "__main__":
    main()
