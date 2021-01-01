## Cleanup
# Revert No confirmation feature
choco feature disable --name=allowGlobalConfirmation

if(Test-PendingReboot) { Invoke-Reboot }

# Enable Windows update
Write-BoxstarterMessage "Running Windows Update..."
Install-WindowsUpdate -AcceptEula

# Enable Microsoft Update
Enable-MicrosoftUpdate

# Remove temp directories
if (Test-Path "C:\vs_cache") {
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\vs_cache"
}

Enable-UAC