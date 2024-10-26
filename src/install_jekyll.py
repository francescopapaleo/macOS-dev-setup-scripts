#!/usr/bin/env python3

import os
import subprocess
from pathlib import Path

def run_command(command, check=True, sudo=False):
    """Run a shell command."""
    if sudo:
        command = f"sudo {command}"
    result = subprocess.run(command, shell=True, check=check, text=True)
    return result

def install_jekyll():
    print("This script installs Jekyll on your system.")
    print("Please make sure you have Homebrew installed.")
    print("More info: https://jekyllrb.com/docs/installation/macos/")

    # Install dependencies using Homebrew
    run_command("brew install chruby ruby-install xz")

    # Install Ruby 3.1.3
    run_command("ruby-install ruby 3.1.3")

    # Add chruby and auto-chruby to the bash profile
    bash_profile = Path.home() / ".bash_profile"
    chruby_setup = f"""
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3
"""
    if chruby_setup not in bash_profile.read_text():
        with open(bash_profile, "a") as f:
            f.write(chruby_setup)
        print("Added chruby configuration to .bash_profile.")

    # Reload the bash profile
    subprocess.run("source ~/.bash_profile", shell=True, check=True)

    # Check Ruby version
    run_command("ruby -v")

    # Install Jekyll
    print("Installing Jekyll...")
    run_command("gem install jekyll", sudo=True)

    print("Jekyll installation complete.")

if __name__ == "__main__":
    install_jekyll()
