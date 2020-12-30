<#
Run Get-ExecutionPolicy. If it returns Restricted, then run either:
    Set-ExecutionPolicy AllSigned
    Set-ExecutionPolicy Bypass -Scope Process
#>

# One-time command to unblock execution of scripts
Set-ExecutionPolicy Unrestricted -Force

<#
If execution policy is not set using the above command run:
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#>

# Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))