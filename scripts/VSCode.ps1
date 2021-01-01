## VSCode
choco install vscode
RefreshEnv

# Need to launch vscode so user folders are created as we can install extensions
$process = Start-Process code -PassThru
Start-Sleep -s 10
$process.Close()

# code --install-extension ms-vscode.csharp
code --install-extension ms-vscode.PowerShell
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension johnpapa.Angular2
code --install-extension donjayamanne.githistory
code --install-extension hnw.vscode-auto-open-markdown-preview
code --install-extension EditorConfig.editorconfig
# code --install-extension djabraham.vscode-yaml-validation
# code --install-extension robertohuertasm.vscode-icons
# code --install-extension PeterJausovec.vscode-docker
# code --install-extension ms-vscode-remote.remote-extensionpack

# pin apps that update themselves
choco pin add -n=vscode
