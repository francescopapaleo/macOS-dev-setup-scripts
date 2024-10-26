#!/usr/bin/env python3

import os
import subprocess
import sys
from pathlib import Path

# Get the absolute path to the directory containing setup_mac.py
base_path = Path(__file__).resolve().parent.parent

# Define the path to the preferences directory
preferences_path = base_path / "preferences"

# Define specific preference files
finder_preferences = preferences_path / "finder_preferences.plist"
terminal_preferences = preferences_path / "terminal_preferences.plist"
vscode_extensions = preferences_path / "vscode_extensions.list"
vscode_settings = preferences_path / "vscode_settings.json"

# Example usage: check if the preferences files exist
if finder_preferences.is_file():
    print(f"Finder preferences found at: {finder_preferences}")
else:
    print("Finder preferences file not found.")

if vscode_extensions.is_file():
    print(f"VSCode extensions list found at: {vscode_extensions}")
else:
    print("VSCode extensions list file not found.")


def run_command(command, check=True, sudo=False):
    """Run a shell command."""
    if sudo:
        command = f"sudo {command}"
    result = subprocess.run(command, shell=True, check=check, text=True)
    return result


def install_xcode_tools():
    """Check and install Xcode Command Line Tools."""
    if (
        subprocess.run(
            "xcode-select --print-path", shell=True, capture_output=True
        ).returncode
        != 0
    ):
        print("Xcode Command Line Tools not found, installing...")
        run_command("xcode-select --install", check=False)
    else:
        print("Xcode Command Line Tools are already installed!")


def determine_brew_path():
    """Determine the Homebrew path for compatibility with Apple Silicon."""
    return (
        "/opt/homebrew/bin/brew"
        if Path("/opt/homebrew/bin").exists()
        else "/usr/local/bin/brew"
    )


def install_homebrew(brew_path):
    """Install Homebrew if not installed."""
    if not shutil.which(brew_path):
        print("Homebrew not found, installing...")
        run_command(
            '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
        )
    else:
        print("Homebrew is already installed!")


def install_essentials(brew_path):
    """Install essential tools with Homebrew."""
    print("Installing essential tools with Homebrew...")
    run_command(f"{brew_path} install wget tree curl")


def setup_pyenv(brew_path):
    """Install and configure pyenv."""
    if not shutil.which("pyenv"):
        print("Installing Pyenv...")
        run_command(f"{brew_path} install pyenv")
    else:
        print("Pyenv is already installed!")

    bash_profile = Path.home() / ".bash_profile"
    pyenv_setup = """
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
"""
    if pyenv_setup not in bash_profile.read_text():
        bash_profile.write_text(pyenv_setup, append=True)
        print("Pyenv initialization added to .bash_profile.")


def install_python_version():
    """Install Python 3.12 with pyenv."""
    if (
        "3.12"
        not in subprocess.run(
            "pyenv versions", shell=True, capture_output=True, text=True
        ).stdout
    ):
        print("Installing Python 3.12...")
        run_command("pyenv install 3.12")
        run_command("pyenv global 3.12")
    else:
        print("Python 3.12 is already installed!")


def add_custom_bash_settings():
    """Add custom bash settings to .bash_profile."""
    bash_profile = Path.home() / ".bash_profile"
    custom_settings = """
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM=xterm-color
export PS1='\\[\\e[0;33m\\]\\u\\[\\e[0m\\]@\\[\\e[0;32m\\]\\h\\[\\e[0m\\]:\\[\\e[0;34m\\]\\w\\[\\e[0m\\]\\$ '
"""
    if custom_settings not in bash_profile.read_text():
        bash_profile.write_text(custom_settings, append=True)
    run_command("chsh -s /bin/bash")


def set_finder_preferences():
    """Set Finder preferences."""
    print("Applying Finder preferences...")
    finder_prefs = {
        "ShowPathbar": "true",
        "ShowStatusBar": "true",
        "AppleShowAllFiles": "true",
        "FXEnableExtensionChangeWarning": "false",
        "FXPreferredViewStyle": "Nlsv",
        "AppleShowAllExtensions": "true",
    }
    for key, value in finder_prefs.items():
        run_command(f"defaults write com.apple.finder {key} -bool {value}")
    run_command("killall Finder")


def install_vscode_extensions():
    """Install VS Code and extensions if available."""
    run_command(f"{brew_path} install --cask visual-studio-code")
    vscode_dir = Path("./preferences/vscode")
    if (vscode_dir / "settings.json").exists():
        (vscode_dir / "settings.json").copy(
            Path.home() / "Library/Application Support/Code/User/settings.json"
        )
    if (vscode_dir / "keybindings.json").exists():
        (vscode_dir / "keybindings.json").copy(
            Path.home() / "Library/Application Support/Code/User/keybindings.json"
        )
    with open(vscode_dir / "extensions.list") as f:
        for extension in f:
            run_command(f"code --install-extension {extension.strip()}")


def install_applications(brew_path):
    """Install various applications and audio plugins."""
    apps = [
        "rar",
        "mist",
        "qlmarkdown",
        "angry-ip-scanner",
        "mysqlworkbench",
        "firefox",
        "google-chrome",
        "google-drive",
        "dropbox",
        "whatsapp",
        "telegram",
        "discord",
        "zotero",
        "anydesk",
        "vlc",
        "spotify",
        "obs",
    ]
    for app in apps:
        run_command(f"{brew_path} install --cask {app}")
    audio_apps = [
        "reaper",
        "cycling74-max",
        "qlab",
        "rekordbox",
        "freac",
        "ffmpeg",
        "izotope-product-portal",
        "native-access",
        "waves-central",
        "ilok-license-manager",
    ]
    for app in audio_apps:
        run_command(f"{brew_path} install --cask {app}")


def main():
    install_xcode_tools()
    brew_path = determine_brew_path()
    install_homebrew(brew_path)
    install_essentials(brew_path)
    setup_pyenv(brew_path)
    install_python_version()
    add_custom_bash_settings()
    set_finder_preferences()
    install_vscode_extensions()
    install_applications(brew_path)
    print(
        "Setup complete! Please install Dante Virtual Soundcard, Dante Controller, HOLOPHONIX Native/Designer, HOLOPHONIX Virtual Soundcard, and HOLOSCORE manually."
    )


if __name__ == "__main__":
    main()
