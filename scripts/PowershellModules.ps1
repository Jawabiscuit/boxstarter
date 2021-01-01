## Powershell Utilities
## Interferes with choco-cleaner as file handles do not get cleaned up
## So run it at the end
#
# Install without prompt
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Tools
Install-Module -Name Carbon -AllowClobber -Force
Install-Module -Name PowerShellHumanizer -Force

Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted