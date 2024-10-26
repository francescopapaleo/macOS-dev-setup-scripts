#!/bin/bash
set -e

# Define paths to each file
PKG_FILES=(
    "BioTek 1.8.5.pkg"
    "BioTek-content-mac_4.0.pkg"
    "GRM_Tools_Classic.pkg"
    "GRM_Tools_Evolution.pkg"
    "GRM_Tools_Spectral_Transform.pkg"
)
DMG_FILES=(
    "ConvologyXT-127.dmg"
    "Convology_Plates-102.dmg"
    "Soundtoys_LittlePlate5_5.4.3.17500.dmg"
    "Soundtoys_LittleRadiator5_5.4.3.17500.dmg"
    "ValhallaFreqEchoOSX_1_2_8.dmg"
    "ValhallaSpaceModulatorOSX_1_2_8.dmg"
    "ValhallaSupermassiveOSX_3_0_0v3.dmg"
    "fabfilter_total_bundle.dmg"
    "neutone-morpho-universal-0.1.6.dmg"
    "neutone_fx-arm64-v1.5.1.dmg"
    "neutone_fx-intel-1.5.1.dmg"
)
DIRECTORY_INSTALLERS=(
    "TAL-Chorus-LX-installer_macos"
    "TAL-Filter-2-installer_macos"
    "TAL-NoiseMaker-installer_macos"
    "TAL-Reverb-4-installer_macos"
    "TAL-vocoder-2-installer_macos"
    "TyrellN6_3"
)

# Install .pkg files
for pkg in "${PKG_FILES[@]}"; do
    echo "Installing $pkg..."
    sudo installer -pkg "$pkg" -target /
done

# Install .dmg files
for dmg in "${DMG_FILES[@]}"; do
    echo "Mounting $dmg..."
    MOUNT_DIR=$(hdiutil attach "$dmg" -nobrowse | grep Volumes | awk '{print $3}')

    # Copy .app files to Applications
    APP=$(find "$MOUNT_DIR" -maxdepth 1 -name "*.app" | head -n 1)
    if [ -n "$APP" ]; then
        echo "Copying $(basename "$APP") to /Applications"
        cp -R "$APP" /Applications
    fi

    # Detach .dmg
    echo "Ejecting $dmg..."
    hdiutil detach "$MOUNT_DIR"
done

# Install applications from directories
for dir in "${DIRECTORY_INSTALLERS[@]}"; do
    echo "Running installer in $dir..."
    if [ -x "$dir/installer" ]; then
        "$dir/installer"  # Assuming a binary named "installer" exists in these directories
    else
        echo "Installer not found in $dir, please run manually."
    fi
done

echo "All installations complete!"
