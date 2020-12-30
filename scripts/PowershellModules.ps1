# Install without prompt
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-PSRepository -Name 'PSGallery' -InstallationPolicy 'Trusted'

# Tools
Install-Module -Name -AllowClobber -Force Carbon
Install-Module -Name -Force PowerShellHumanizer

Set-PSRepository -Name 'PSGallery' -InstallationPolicy 'Untrusted'