#!/bin/bash
set -e

# Define paths to each main .pkg file
PKG_FILES=(
    "BioTek 1.8.5.pkg"
    "BioTek-content-mac_4.0.pkg"
    "GRM_Tools_Classic.pkg"
    "GRM_Tools_Evolution.pkg"
    "GRM_Tools_Spectral_Transform.pkg"
)

# Define paths to directories containing additional .pkg files
PKG_DIRS=(
    "TAL-Chorus-LX-installer_macos"
    "TAL-Filter-2-installer_macos"
    "TAL-NoiseMaker-installer_macos"
    "TAL-Reverb-4-installer_macos"
    "TAL-vocoder-2-installer_macos"
    "TyrellN6_3"
)

# Install main .pkg files
for pkg in "${PKG_FILES[@]}"; do
    if [ -f "$pkg" ]; then
        echo "Installing $pkg..."
        sudo installer -pkg "$pkg" -target /
    else
        echo "Package file $pkg not found. Skipping..."
    fi
done

# Install .pkg files located in subdirectories
for dir in "${PKG_DIRS[@]}"; do
    echo "Searching for .pkg files in $dir..."
    if [ -d "$dir" ]; then
        PKG_FILE=$(find "$dir" -maxdepth 1 -name "*.pkg" | head -n 1)
        if [ -n "$PKG_FILE" ]; then
            echo "Installing $(basename "$PKG_FILE") from $dir..."
            sudo installer -pkg "$PKG_FILE" -target /
        else
            echo "No .pkg file found in $dir. Skipping..."
        fi
    else
        echo "Directory $dir not found. Skipping..."
    fi
done

echo "All installations complete!"
