# macOS Dev Setup Scripts

A collection of Bash scripts designed to automate the setup and configuration of a macOS development environment. 
This repo relies on [Homebrew](https://brew.sh/), a package manager for macOS or Linux.

## Features

- **Automated Software Update**: Option to run `softwareupdate` to ensure macOS is fully up-to-date.
- **Xcode Command Line Tools**: Automatic installation of the essential tools for building macOS and iOS apps.
- **Homebrew Installation**: Installation of Homebrew if not already present, along with essential packages and cask applications.
- **Pyenv Installation**: Installation and configuration of `pyenv`, and automatic installation of Python 3.10.
- **Finder and Terminal Customizations**: Application of saved Finder and Terminal preferences.
- **VS Code Setup**: Automated installation of Visual Studio Code, with restoration of user settings, keybindings, and extensions.
- **Additional Applications**: Installation of additional apps via Homebrew casks (e.g., audio apps, developer tools).

## Prerequisites

- macOS 10.13.6 or later
- Administrator access on your macOS system
- Internet connection

## Repository Structure
```
.
├── LICENSE
├── README.md                 # This file
├── core                      # Core installation scripts
│   ├── audio-apps.sh         # Script for installing audio-related apps
│   ├── casks.sh              # Script for installing cask apps via Homebrew
│   ├── customizations.sh     # Script for applying customizations
│   ├── finder.sh             # Script for Finder customizations
│   ├── homebrew.sh           # Script for Homebrew installation and setup
│   ├── jekyll.sh             # Optional Jekyll setup script
│   ├── pyenv.sh              # Script for Pyenv installation and Python setup
│   └── vscode.sh             # Script for VS Code installation and setup
├── dotfiles                  # Placeholder for user-specific dotfiles
├── install.sh                # Main script to launch the setup process
├── preferences               # Finder and Terminal preferences
│   ├── finder_preferences.plist
│   └── terminal_preferences.plist
├── utils                     # Utility scripts
│   └── brew_pyenv_relink.sh  # Helper script to relink brew and pyenv paths
└── vim                       # Vim configuration
    └── vimrc                 # Example Vim configuration file
```

## Installation and use

### 1. Clone the Repository:

Start by cloning the `macOS Dev Setup Scripts` repository to your local machine.

```bash
git clone https://github.com/francescopapaleo/macos-dev-setup-scripts.git
```

### 2. Run the main installation script:

```bash
cd macos-dev-setup-scripts
./install.sh
```

## License
```
macOS Dev Setup Scripts - Automate setup of a dev environment

Copyright (C) 2024 Francesco Papaleo

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
