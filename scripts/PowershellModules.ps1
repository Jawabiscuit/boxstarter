# Install without prompt
Set-PSRepository -Name 'PSGallery' -InstallationPolicy 'Trusted'

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Tools
Install-Module -Name -AllowClobber -Force Carbon
Install-Module -Name -Force PowerShellHumanizer

Set-PSRepository -Name 'PSGallery' -InstallationPolicy 'Untrusted'