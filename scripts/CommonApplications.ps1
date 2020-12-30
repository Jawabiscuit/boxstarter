# Common tools for users typically need

# Internet
choco install --limitoutput firefox
choco install --limitoutput chrome

# Utils
choco install --limitoutput f.lux
choco install --limitoutput adobereader
choco install --limitoutput etcher

# Social
choco install --limitoutput zoom

# Media
choco install --limitoutput spotify
choco install --limitoutput vlc
choco install --limitoutput k-litecodecpack-standard

# VNC
choco install --limitoutput nomachine
choco install --limitoutput realvnc

# Image Editor
choco install --limitoutput inkscape
choco install --limitoutput gimp

# Document Creation
choco install --limitoutput libreoffice-fresh

# Security
# TODO: Spybot S&D and Anti-Beacon

# Pin apps that update themselves
choco pin add -n=firefox
choco pin add -n=chrome

# Pin items to the taskbar
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"