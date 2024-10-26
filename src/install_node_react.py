#!/usr/bin/env python3

import subprocess

def run_command(command, check=True):
    """Run a shell command."""
    result = subprocess.run(command, shell=True, check=check, text=True)
    return result

def install_node_npm_react():
    print("Installing Node.js, npm, and React...")

    # Install Node.js and npm via Homebrew
    print("Installing Node.js and npm with Homebrew...")
    run_command("brew install node")

    # Verify Node.js and npm installation
    run_command("node -v")
    run_command("npm -v")

    # Install React globally via npm
    print("Installing React globally via npm...")
    run_command("npm install -g create-react-app")

    # Verify React installation
    print("Verifying React installation...")
    run_command("create-react-app --version")

    print("Node.js, npm, and React installation complete.")

if __name__ == "__main__":
    install_node_npm_react()
