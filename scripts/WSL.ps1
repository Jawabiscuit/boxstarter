## Windows Subsystem for Linux
# TODO: Test on a Windows Pro machine
# choco install wsl-ubuntu-1804
#
# --- Ubuntu ---
# TODO: Move this to choco install once --root is included in that package
# Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
# Add-AppxPackage -Path ~/Ubuntu.appx
# run the distro once and have it install locally with root user, unset password
#
# RefreshEnv
# Ubuntu1804 install --root
# Ubuntu1804 run apt update
# Ubuntu1804 run apt upgrade -y
#
# write-host "Installing tools inside the WSL distro..."
# Ubuntu1804 run apt install python2.7 python-pip -y 
# # Ubuntu1804 run apt install python-numpy python-scipy -y
# # Ubuntu1804 run pip install pandas
#
# write-host "Finished installing tools inside the WSL distro"
#
# Enable-WindowsOptionalFeature -Online -FeatureName containers -All
# RefreshEnv
#
# choco install docker-for-windows
# choco install vscode-docker
#
# pin apps that update themselves
# choco pin add -n=docker-for-windows