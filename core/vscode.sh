echo "Setting up VS Code..."

# Install Visual Studio Code
brew install --cask visual-studio-code

# Restore VS Code settings and keybindings
echo "Restoring VS Code settings and keybindings..."
cp ./preferences/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
cp ./preferences/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Install VS Code extensions
echo "Installing VS Code extensions..."
while read extension; do
    code --install-extension "$extension"
done < ./preferences/vscode/extensions.list

echo "VS Code setup complete!"