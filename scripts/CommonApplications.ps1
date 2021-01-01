## Common Applications
# Internet
choco install firefox
choco install googlechrome.dev

# Utils
choco install f.lux
choco install adobereader
choco install etcher

# Social
choco install zoom

# Media
# TODO: Remote error
# choco install spotify
choco install vlc
choco install k-litecodecpack-standard

# VNC
choco install nomachine
choco install realvnc

# Image Editor
choco install inkscape
choco install gimp

# Document Creation
choco install libreoffice-fresh

# Security
# TODO: Spybot S&D and Anti-Beacon

# Pin apps that update themselves
choco pin add -n=firefox

# Pin items to the taskbar
Install-ChocolateyPinnedTaskBarItem -TargetFilePath "${env:LOCALAPPDATA}\Google\Chrome\Application\chrome.exe"
